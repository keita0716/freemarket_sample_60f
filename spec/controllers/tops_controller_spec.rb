require 'rails_helper'

describe TopsController do
  describe 'GET #index' do
    #it "Itemモデルからcategory_left_idの数が多い順に並べられているか" do
      #items = FactoryBot.create_list(:item, 10)
      #get :index
      #expect(assigns(:category)).to match(items.sort{|a, b| b.category_left_id <=> a.category_left_id })
    #end
    #it "Itemモデルからcategory_left_idの数が多い順に並べられているか" do
      #items = FactoryBot.create_list(:item, 10)
      #get :index
      #expect(assigns(:brand)).to match(items.sort{|a, b| b.category_left_id <=> a.category_left_id })
    #end
    #it "Itemモデルから出品中の商品を抽出することができるか" do
      #items = FactoryBot.create_list(:item, 10)
      #get :index
      #expect(assigns(:item)).to match(items)
    #end
  end
end