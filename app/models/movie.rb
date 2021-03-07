class Movie < ActiveRecord::Base
    
  def self.all_ratings
    ['G','PG','PG-13','R']
  end
  
 def self.with_ratings(ratings_list,sort_by)
    # If both sort and ratings are sent
    if ratings_list.present? and sort_by.present?
     
     if sort_by == 'title'
       Movie.where(rating: ratings_list).order(title: 'ASC')
     elsif sort_by == 'release_date'
       Movie.where(rating: ratings_list).order(release_date: 'ASC')
     end
   
    elsif ratings_list.present?
      Movie.where(rating: ratings_list) 
      
    elsif sort_by.present?
     if sort_by == 'title'
       Movie.all.order(title: 'ASC')
     else
       Movie.all.order(release_date: 'ASC')
     end
   else
      Movie.all

   end

 end
end
