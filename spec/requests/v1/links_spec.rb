RSpec.describe 'Links API', type: :request do
  let(:link) { build(:link) }

  describe 'POST /link' do
    let(:url) { { url: link.url } }
    let(:too_short_url) { { url: 'i' * (Constants::URL_LENGTH.min - 1) } }
    let(:too_long_url) { { url: 'i' * (Constants::URL_LENGTH.max + 1) } }

    context 'when the request is valid' do
      before { post '/api/link/', params: url }

      it 'returns url' do
        expect(json['url']).to eq(url[:url])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when request is invalid -- no url is provided' do
      before { post '/api/link/', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when request is invalid -- too short url' do
      before { post '/api/link/', params: too_short_url }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when request is invalid -- too long url' do
      before { post '/api/link/', params: too_long_url }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /redirect_to_url' do
    let(:link) { build(:link) }

    before do
      link.slug = 'test_slug'
      allow_any_instance_of(FileManager).to receive(:load).and_return([link])
      get "http://localhost:3000/#{link.slug}"
    end

    it 'redirects to url' do
      expect(response).to have_http_status(:redirect)
    end
  end
end
