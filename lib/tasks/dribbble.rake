namespace :dribbble do
  desc "TODO"
  task get_recent: :environment do

    #URL API CALL FOR TOP 12 MOST-POPULAR SHOTS
    url="https://api.dribbble.com/v1/shots/?access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"

    response = HTTParty.get(url)
    recent_shots = JSON.parse(response.body)

    recent_shots.each do |s|
      users_dribbbleid = s['user']['id']
      shots_dribbbleid = s['user']['id']

      user_url_value = s['user']['avatar_url']
      shot_url_value = s["images"]["hidpi"]
      comment_url_value = s['user']['avatar_url']

      existing_user = User.where(designer_id: users_dribbbleid)

      #IS THERE A EXISTING USER IN THE DATABASE? IF NO, THEN...
      if existing_user.empty?
        newuser = User.create(
          designer_id: s['user']['id'],
          designer_full_name: s['user']['name'],
          designer_username: s['user']['username'],
          designer_home_url: s['user']['html_url'],
          designer_avatar_url: s['user']['avatar_url'],
          designer_bio: s['user']['bio'],
          designer_location: s['user']['location'],
          designer_bk_count: s['user']['buckets_count'],
          designer_comments_received_count: s['user']['comments_received_count'],
          designer_follower_count: s['user']['followers_count'],
          designer_is_following_count: s['user']['followings_count'],
          designer_made_likes_count: s['user']['likes_count'],
          designer_received_likes_count: s['user']['likes_received_count'],
          designer_project_count: s['user']['projects_count'],
          designer_rebounds_received_count: s['user']['rebounds_received_count'],
          designer_added_shots_count: s['user']['shots_count'],
          designer_list_of_followers_url: s['user']['followers_url'],
          designer_following_list_url: s['user']['following_url'],
          designer_list_of_shots_url: s['shots_url'],
          localuserimage: URI.parse(user_url_value)
          )
        newshot = Shot.create(
          dribbble_id: s["id"],
          title: s["title"],
          description: s["description"],
          width: s["width"],
          height: s["height"],
          images_hidpi: s["images"]["hidpi"],
          images_normal: s["images"]["normal"],
          images_teaser: s["images"]["teaser"],
          viewcount: s["views_count"],
          likes_count: s['likes_count'],
          comments_count: s['comments_count'],
          attachments_count: s['attachments_count'],
          rebounds_count: s['rebounds_count'],
          buckets_count: s['buckets_count'],
          html_url: s['html_url'],
          attachments_url: s["attatchments_url"],
          buckets_url: s['buckets_url'],
          comments_url: s['comments_url'],
          likes_url: s['likes_url'],
          projects_url: s['projects_url'],
          animated: s['animated'],
          tags: s['tags'],
          user_id: newuser.id,
          localshotimage: URI.parse(shot_url_value)
          )
        commentresponse = HTTParty.get(s['comments_url']+"?access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03")
        comments = JSON.parse(commentresponse.body)
        comments.each do |c|
        comments_dribbbleid = c["id"]

        comment_url_value = c["user"]["avatar_url"]

        existing_comment = Comment.where(comment_id: comments_dribbbleid)

        if existing_comment.empty?
          newcomment = Comment.create(
            comment_id: c["id"].to_s,
            comment_created_at: c["created_at"],
            body: c["body"],
            user_avatar_url: c["user"]["avatar_url"],
            user_id: c["user"]["id"],
            user_name: c['user']['name'],
            shot_id: newshot.id,
            localcommentimage: URI.parse(comment_url_value)
            )
          end
        end

        #IF THERE IS AN EXISTING USER ALREADY, THEN CHECK IF THERE IS AN EXISTING SHOT.  IF THERE IS NOT AN EXISTING SHOT, THEN...
        else
          existing_user = User.where(designer_id: users_dribbbleid)
          existing_shot = Shot.where(user_id: existing_user[0].id)
          if existing_shot.empty?
            newshot = Shot.create(
              dribbble_id: s["id"],
              title: s["title"],
              description: s["description"],
              width: s["width"],
              height: s["height"],
              images_hidpi: s["images"]["hidpi"],
              images_normal: s["images"]["normal"],
              images_teaser: s["images"]["teaser"],
              viewcount: s["views_count"],
              likes_count: s['likes_count'],
              comments_count: s['comments_count'],
              attachments_count: s['attachments_count'],
              rebounds_count: s['rebounds_count'],
              buckets_count: s['buckets_count'],
              html_url: s['html_url'],
              attachments_url: s["attatchments_url"],
              buckets_url: s['buckets_url'],
              comments_url: s['comments_url'],
              likes_url: s['likes_url'],
              projects_url: s['projects_url'],
              animated: s['animated'],
              tags: s['tags'],
              user_id: existing_user[0].id,
              localshotimage: URI.parse(shot_url_value)
              )

            commentresponse = HTTParty.get(s['comments_url']+"?access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03")
            comments = JSON.parse(commentresponse.body)
            comments.each do |c|

            comment_url_value = c["user"]["avatar_url"]

            comments_dribbbleid = c["id"]
            existing_comment = Comment.where(comment_id: comments_dribbbleid)

            if existing_comment.empty?
              newcomment = Comment.create(
                comment_id: c["id"].to_s,
                comment_created_at: c["created_at"],
                body: c["body"],
                user_avatar_url: c["user"]["avatar_url"],
                user_id: c["user"]["id"],
                user_name: c['user']['name'],
                shot_id: newshot.id,
                localcommentimage: URI.parse(comment_url_value)
                )
              end
            end
        end
      end
    end
  end
end


#URL API CALL FOR TOP 12 MOST-RECENT SHOTS
    # url="https://api.dribbble.com/v1/shots/?recent&access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"

#URL API CALL FOR SPECIFIC USERS SHOTS - BUT WHOLE SYNTAX NEEDS TO BE ADDED BELOW TO MAKE FUNCTIONAL
    # url="https://api.dribbble.com/v1/users/5025/?shots&access_token=6359e4078d55834cf715249524d38c2a8467f25e1a881646a5fc436210a2ff03"
