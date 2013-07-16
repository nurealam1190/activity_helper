include ApplicationHelper

def sign_in(user)
  visit new_user_session_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  #cookies[:remember_token] = user.remember_token
end
# def sign_in(user)
#         #cookies.permanent[:remember_token] = user.remember_token
#         self.current_user = user
#     end



def full_title(page_title)
  base_title = "ActivityHelper"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end