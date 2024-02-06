require 'rails helper'

RSpec.describe 'Posts API', type: :request do
  descbibe 'POST /posts' do
    let (:validates_attributes) {{title:'my first post',context:'content of the post'}}

    context 'when the request is valid' do
      it 'creates a new post' do
        expect {
          post '/posts', params: {post: valid_attributes}
      }.to change(Post, :count).by(1)
        
      expect(response).to have_http_status(201)
      expect(json['title']).to eq('my first post)
      expect(json['content']).to eq('content of the post')
      end
    end
  end

  def json
    JSON.parse(response.body)
  end
end