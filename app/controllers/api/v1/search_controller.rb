class Api::V1::SearchController < Api::V1::BaseController
  def index
    @query = params[:query]
    @result = PgSearch.multisearch(@query)
    render json: @result.to_json, status: :ok
  end
end
