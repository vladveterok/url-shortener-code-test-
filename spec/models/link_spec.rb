RSpec.describe Link, type: :model do
  context 'with validations' do
    let(:too_short_url) { 'i' * (Constants::URL_LENGTH.min - 1) }
    let(:too_long_url) { 'i' * (Constants::URL_LENGTH.max + 1) }
    let(:blank) { "Url #{I18n.t('url.messages.cannot_be_blank')}" }
    let(:too_short_message) { "Url #{I18n.t('url.messages.too_short')}" }
    let(:too_long_message) { "Url #{I18n.t('url.messages.too_long')}" }

    it 'validates presence of url' do
      link = described_class.new
      link.valid?
      expect(link.errors.full_messages).to include(blank)
    end

    it 'validates url minimum length' do
      link = described_class.new(url: too_short_url)
      link.valid?
      expect(link.errors.full_messages).to include(too_short_message)
    end

    it 'validates url maximum length' do
      link = described_class.new(url: too_long_url)
      link.valid?
      expect(link.errors.full_messages).to include(too_long_message)
    end
  end
end
