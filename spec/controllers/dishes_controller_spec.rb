require 'rails_helper'

RSpec.describe DishesController, type: :controller do
  let(:user) { create(:user) }
  let!(:dish) { create(:dish, user: user) }
  
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
        get :show, params: {id: dish}, xhr: true
      end

      it 'assigns the requested dish to @dish' do  
        expect(assigns(:dish)).to eq dish
      end

     it 'calls EnergyValueService' do
      allow( assigns(:energy_value)).to receive(:calculate)
      end

      it 'returns successful status' do  
        expect(response).to have_http_status(:successful)
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
end
