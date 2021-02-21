module PgSearch
  class DocumentPresenter < BasePresenter
    related_to :searchable
    build_with :content, :searchable_id, :searchable_type

    # TODO: add url in response.body
  end
end
