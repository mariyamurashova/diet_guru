require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:user) }

   describe 'DELETE #destroy' do  
      before do
        user.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'avatar.jpg')), filename: 'avatar.jpg', content_type: 'image/img')
        login(user)
      end

      it "deletes the file" do 
        expect { delete :destroy, params: {  id: user.image  }, format: :json }.to change(ActiveStorage::Attachment, :count).by(-1)
      end
    end
  end
