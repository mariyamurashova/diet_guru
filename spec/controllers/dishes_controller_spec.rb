require 'rails_helper'

RSpec.describe DishesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:dish) { create(:dish, user: user) }
  let!(:product) { create(:product) }
  let!(:dish_ingredient) { create(:dish_ingredient, product:product, dish:dish) }
   describe 'POST #create' do 

    context 'Authenticated user' do
    
      before { login(user) }

      context 'with valid attributes' do 
        it 'saves a new dish in the datebase' do  
          expect{ post :create, params: {dish: attributes_for(:dish) }, format: :json }.to change(Dish, :count).by(1)
        end

        it 'returns successful status' do  
          post :create, params: { dish: attributes_for(:dish) , format: :json }
          expect(response).to have_http_status(:successful)
        end
      end
      
      context 'with invalid attributes' do 
        it 'does not save the dish' do
          expect{ post :create, params: { dish: attributes_for(:dish, title: nil),  format: :json }  }.to_not change(Dish, :count)
        end

        it 'returns fail status' do  
          post :create, params: { dish: attributes_for(:dish, title: nil), format: :json }
          expect(response).to have_http_status(:bad_request)
        end
      end
    end

    describe 'GET #show' do
      before do 
        login(user) 
        get :show, params: {id: dish}
      end

      it 'assigns the requested dish to @dish' do  
        expect(assigns(:dish)).to eq dish
      end

     it 'calls EnergyValueService' do
      allow( assigns(:energy_value)).to receive(:calculate)
      end

      it 'redirects to show view' do  
       expect(response).to render_template :show
      end
    end
    
    context 'Unauthenticated user' do

      it "doesn't save the answer" do 
        expect { post :create, params: { dish: attributes_for(:dish), format: :json } }.to_not change(Dish, :count)
      end
      
      it 'redirects to sign in' do  
          post :create, params: { dish: attributes_for(:dish), format: :json }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do 
      it "changes dish's attributes" do
        patch :update, params: { id: dish, dish: {title: 'new dish', number_of_servings: dish.number_of_servings, 
                                dish_ingredients_attributes: [:id, :product_id, :weight, :_destroy]} }, format: :js
        dish.reload
        expect(dish.title).to eq 'new dish'
      end

      it 'returns status 200 OK' do
        patch :update, params: { id: dish, dish: {title: 'new dish', number_of_servings: dish.number_of_servings, 
                                dish_ingredients_attributes: [:id, :product_id, :weight, :_destroy]} }, format: :js
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE #destroy' do 

    context 'owner delete his answer' do
      before { login(user) }
     
      it "deletes the dish" do 
        expect { delete :destroy, params: { id: dish } }.to change(Dish, :count).by(-1)
      end
    end
  end
end
