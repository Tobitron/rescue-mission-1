require 'rails_helper'
feature "user creates a new post" do

  scenario "User fills out and submit form successfully" do
    visit new_question_path
    fill_in :title, with: "Question100dkjhawdkhawdhawdkljahwdaklwjdhaw12345678901112111314djlhalawdawd"
    fill_in :description, with: "lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec tellus augue. Phasellus posuere leo turpis, ac facilisis sem mollis et. Pellentesque leo velit, vulputate sed nibh eget, tristique sodales sem. Vestibulum commodo dolor bibendum consequat rutrum. Sed euismod vestibulum lectus. Aliquam tempor ornare lacus, nec semper leo bibendum id. Aenean dictum mollis ligula ac imperdiet. Sed consectetur turpis a ex semper posuere. Sed aliquam justo tempor arcu pretium, nec porttitor neque placerat. Nullam eros quam, imperdiet a mattis eu, finibus at nisi. Vivamus mauris odio, laoreet ac feugiat eu, imperdiet ac enim. Curabitur dui risus, maximus ultrices scelerisque vel, pretium fermentum arcu. Aliquam quis ultricies quam. Curabitur ullamcorper augue in lacus pellentesque facilisis. Sed ac fringilla erat. Proin sit amet mauris nec elit mattis tempor non vitae odio."
    click_button 'Submit'
    expect(page).to have_content("Question Created")
    visit '/'
    expect(page).to have_content("Question100dkjhawdkhawdhawdkljahwdaklwjdhaw12345678901112111314djlhalawdawd")
  end

  scenario "User fills out form and title too short" do
    visit new_question_path
    fill_in :title, with: "Question"
    fill_in :description, with: "lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec tellus augue. Phasellus posuere leo turpis, ac facilisis sem mollis et. Pellentesque leo velit, vulputate sed nibh eget, tristique sodales sem. Vestibulum commodo dolor bibendum consequat rutrum. Sed euismod vestibulum lectus. Aliquam tempor ornare lacus, nec semper leo bibendum id. Aenean dictum mollis ligula ac imperdiet. Sed consectetur turpis a ex semper posuere. Sed aliquam justo tempor arcu pretium, nec porttitor neque placerat. Nullam eros quam, imperdiet a mattis eu, finibus at nisi. Vivamus mauris odio, laoreet ac feugiat eu, imperdiet ac enim. Curabitur dui risus, maximus ultrices scelerisque vel, pretium fermentum arcu. Aliquam quis ultricies quam. Curabitur ullamcorper augue in lacus pellentesque facilisis. Sed ac fringilla erat. Proin sit amet mauris nec elit mattis tempor non vitae odio."
    click_button 'Submit'
    expect(page).to have_content("Description too short")
  end

  scenario "User fills out form and description too short" do
    visit new_question_path
    fill_in :title, with: "Question100dkjhawdkhawdhawdkljahwdaklwjdhaw12345678901112111314djlhalawdawd"
    fill_in :description, with: "hi"
    click_button 'Submit'
    expect(page).to have_content("Title too short")
  end

  scenario "User creates question and the title still exists" do
    visit new_question_path
    fill_in :title, with: "Question100dkjhawdkhawdhawdkljahwdaklwjdhaw12345678901112111314djlhalawdawd"
    fill_in :description, with: "hi"
    click_button 'Submit'
    expect(page).to have_content("This question already exists")
  end
end
