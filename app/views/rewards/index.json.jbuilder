json.rewards do
  json.array! @rewards do |reward|
    json.merge! reward.attributes
  end
end
json.(@rewards, :total_pages, :current_page, :next_page, :prev_page)
