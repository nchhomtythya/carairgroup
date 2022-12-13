if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {car: @car, review: Review.new})
  json.inserted_item render(partial: "cars/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {car: @car, review: @review})
end
