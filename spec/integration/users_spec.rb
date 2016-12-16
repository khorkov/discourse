require 'rails_helper'

RSpec.describe "Users" do
  let(:user) { Fabricate(:user) }

  describe "updating a user" do
    before do
      sign_in(user)
    end

    it "should be able to update a user" do
      put "/users/#{user.username}.json", { name: 'test.test' }

      expect(response).to be_success
      expect(user.reload.name).to eq('test.test')
    end

    describe 'when username contains a period' do
      before do
        user.update!(username: 'test.test')
      end

      it "should be able to update a user" do
        put "/users/#{user.username}.json", { name: 'testing123' }

        expect(response).to be_success
        expect(user.reload.name).to eq('testing123')
      end
    end
  end
end
