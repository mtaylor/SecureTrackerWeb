class LocationsDatatable
  delegate :params, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Location.count,
      iTotalDisplayRecords: locations.total_entries,
      aaData: data
    }
  end

private

  def data
    locations.map do |location|
      [
        location.time,
        location.user,
        location.longitude,
        location.latitude,
      ]
    end
  end

  def locations
    @locations ||= fetch_locations
  end

  def fetch_locations
    locations = Location.order("#{sort_column} #{sort_direction}")
    locations = locations.page(page).per_page(per_page)
    locations
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id time user]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end