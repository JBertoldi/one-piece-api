class Api::V1::CharactersController < ActionController::API
  def index
    characters = Character.all
    characters = characters.map do |character|
      {
        id: character.id,
        english_name: character.en_name,
        japanese_name: character.jp_name,
        epithet: character.epithet,
        bounty: character.bounty,
        pirate_crew: character.pirate_crew,
        devil_fruit: character.devil_fruit
      }
    end
    render json: { results: characters }.to_json, status: :ok
  end
end
