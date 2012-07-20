require 'spec_helper'

describe ProfilesController do
  
  before(:each) do
    @user = FactoryGirl.create :user
    sign_in :user, @user
  end
  
  def valid_attributes
    {
      :user_name => "Kate Moss",
      :user_type => "Model",
      :about_me => "I'm a model! I strike poses",
      :references => "All photographers love me" 
    }
  end

  describe "GET index" do
    it "assigns all profiles as @profiles" do
      profile = FactoryGirl.create :profile
      get :index
      assigns(:profiles).should eq([profile])
    end
  end

  describe "GET show" do
    it "assigns the requested profile as @profile" do
      profile = FactoryGirl.create :profile
      get :show, {:id => profile.to_param}
      assigns(:profile).should eq(profile)
    end
  end

  describe "GET new" do
    it "assigns a new profile as @profile" do
      get :new, {}
      assigns(:profile).should be_a_new(Profile)
    end
  end

  describe "GET edit" do
    it "assigns the requested profile as @profile" do
      profile = FactoryGirl.create :profile
      get :edit, {:id => profile.to_param}
      assigns(:profile).should eq(profile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Profile" do
        expect {
          post :create, {:profile => valid_attributes}
        }.to change(Profile, :count).by(1)
      end

      it "assigns a newly created profile as @profile" do
        post :create, {:profile => valid_attributes}
        assigns(:profile).should be_a(Profile)
        assigns(:profile).should be_persisted
      end

      it "redirects to the created profile" do
        post :create, {:profile => valid_attributes}
        response.should redirect_to(Profile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved profile as @profile" do
        Profile.any_instance.stub(:save).and_return(false)
        post :create, {:profile => {}}
        assigns(:profile).should be_a_new(Profile)
      end

      it "re-renders the 'new' template" do
        Profile.any_instance.stub(:save).and_return(false)
        post :create, {:profile => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested profile" do
        profile = FactoryGirl.create :profile
        Profile.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => profile.to_param, :profile => {'these' => 'params'}}
      end

      it "assigns the requested profile as @profile" do
        profile = FactoryGirl.create :profile
        put :update, {:id => profile.to_param, :profile => valid_attributes}
        assigns(:profile).should eq(profile)
      end

      it "redirects to the profile" do
        profile = FactoryGirl.create :profile
        put :update, {:id => profile.to_param, :profile => valid_attributes}
        response.should redirect_to(profile)
      end
    end

    describe "with invalid params" do
      it "assigns the profile as @profile" do
        profile = FactoryGirl.create :profile
        Profile.any_instance.stub(:save).and_return(false)
        put :update, {:id => profile.to_param, :profile => {}}
        assigns(:profile).should eq(profile)
      end

      it "re-renders the 'edit' template" do
        profile = FactoryGirl.create :profile
        Profile.any_instance.stub(:save).and_return(false)
        put :update, {:id => profile.to_param, :profile => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested profile" do
      profile = FactoryGirl.create :profile
      expect {
        delete :destroy, {:id => profile.to_param}
      }.to change(Profile, :count).by(-1)
    end

    it "redirects to the profiles list" do
      profile = FactoryGirl.create :profile
      delete :destroy, {:id => profile.to_param}
      response.should redirect_to(profiles_url)
    end
  end 
end