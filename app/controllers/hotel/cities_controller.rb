class Hotel::CitiesController < SortableController
  actions :all, except: [:show]
end
