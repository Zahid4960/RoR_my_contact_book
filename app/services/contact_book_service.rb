class ContactBookService

  require_relative '../repos/base_repo'
  require_relative '../models/contact_book'

  @@model = ContactBook

  def index(page, limit)
    base_repo.get_all(@@model, page, limit)
  end

  def create(payload)
    base_repo.save_data(@@model, payload)
  end

  def show(id)
    base_repo.find_by_id(@@model, id)
  end

  def update(id, payload)
    base_repo.update_data(@@model, id, payload)
  end

  def destroy(id)
    base_repo.delete_data(@@model, id)
  end

  def last_inserted
    base_repo.last_inserted(@@model)
  end

  def base_repo
    @repo = BaseRepo.new
  end
end