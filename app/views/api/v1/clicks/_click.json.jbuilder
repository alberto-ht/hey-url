json.(aClick, :id, :browser, :platform, :created_at)
json.url aClick.url, partial: 'api/v1/urls/url', as: :url
# Example:
#  {
#    "id": 1,
#    "species": "Rainbow Trout",
#    "weight": "4.0",
#    "length": "22.0",
#    "created_at": "2018-11-01 23:07:54 UTC"
#  }