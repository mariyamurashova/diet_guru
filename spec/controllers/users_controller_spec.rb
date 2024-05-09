require 'rails_helper'

RSpec.describe UsersController, type: :controller do
   describe 'PATCH #update' do
   
    let!(:user) { create(:user) }
   
    before { login(user) }

    context 'with valid attributes' do 
      it "changes user's attributes" do
        patch :update, params: { id: user, user: {first_name: 'Petr', last_name: 'Petrov', date_of_birth: '21.04.1997', current_weight: 86, target_weight: 80} }, format: :turbo_stream 
        user.reload
        expect(user.first_name).to eq 'Petr'
      end

      it 'returns status 200 OK' do
        patch :update, params: { id: user, user: {first_name: 'Petr', last_name: 'Petrov', date_of_birth: '21.04.1997', current_weight: 86, target_weight: 80} }, format: :turbo_stream 
        expect(response).to have_http_status(200)
      end
    end
  end
end
