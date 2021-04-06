class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :contact, :status, :account
  attributes :id, :name, :email, :contact, :status, :password, :account if $check == true 

  def default_serializer_options
    {root: true}
  end
  def account
    if object.public_acc==true
      return "Public"
    elsif object.public_acc==false
      return "Private"
    end
  end
end
