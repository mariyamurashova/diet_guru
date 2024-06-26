require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { create(:user) }
  let(:product) { create(:product) }

  describe 'POST #create' do 

    context 'Authenticated user' do
    
      before { login(user) }

      context 'with valid attributes' do 
        it 'saves a new product in the datebase' do 
         
          expect{ post :create, params: {product: attributes_for(:product) }, format: :json }.to change(Product, :count).by(1)
        end

        it 'returns successful status' do  
          post :create, params: { product: attributes_for(:product) , format: :json }
          expect(response).to have_http_status(:successful)
        end
      end
      
      context 'with invalid attributes' do 
        it 'does not save the product' do
          expect{ post :create, params: { product: attributes_for(:product, title: nil), format: :json }  }.to_not change(Product, :count)
        end

        it 'returns fail status' do  
          post :create, params: { product: attributes_for(:product, title: nil), format: :json }
          expect(response).to have_http_status(:bad_request)
        end
      end
    end

    context 'Unauthenticated user' do

      it "doesn't save the answer" do 
        expect { post :create, params: { product: attributes_for(:product), format: :json } }.to_not change(Product, :count)
      end
      
      it 'redirects to sign in' do  
          post :create, params: { product: attributes_for(:product), format: :json }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'PATCH #update' do
   
    before { login(user) }

    context 'with valid attributes' do 
      it "changes product's attributes" do
        patch :update, params: { id: product, product: {title: 'new product', brand_name: product.brand_name, 
                                calorie: product.calorie, protein: product.protein, fat: product.fat, 
                                carbohydrate: product.carbohydrate} }, format: :js
        product.reload
        expect(product.title).to eq 'new product'
      end

      it 'returns status 200 OK' do
        patch :update, params: { id: product, product: {title: 'new product', brand_name: product.brand_name, 
                                calorie: product.calorie, protein: product.protein, fat: product.fat, 
                                carbohydrate: product.carbohydrate} }, format: :js
        expect(response).to have_http_status(200)
      end
    end
  end
end
