require './config/environment'

def trim
  ps = Friendship.all
  unique = []
  ps.each do |f|
    if unique.empty?
      unique<<f
    else
      unique.each do |u|
        if u.user_id == f.user_id && u.friend_id == f.friend_id
          p f
          f.destroy
        else
          unique << f
          p unique
        end
      end
    end
  end
  p "unique = "
  p unique
  p Friendship.all
end

trim
