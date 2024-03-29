# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Lecture.destroy_all

Lecture.create!(title: "Machine Learning Fundamentals", description: "Explore the fundamentals of machine learning, covering topics such as supervised and unsupervised learning, regression, classification, and clustering. Learn how to build and evaluate machine learning models using popular frameworks like scikit-learn and TensorFlow.", available_places: 25)
Lecture.create!(title: "Big Data Analytics and Technologies", description: "Dive into the world of big data analytics, understanding technologies like Apache Hadoop and Spark. Discover how to process and analyze massive datasets efficiently, and gain insights into data storage, processing frameworks, and distributed computing for big data applications.", available_places: 40)
Lecture.create!(title: "ISO 27001 Workshop", description: "Join us for a hands-on workshop on ISO 27001. Explore the principles and practices of information security management. Learn how to establish, implement, maintain, and continually improve an information security management system (ISMS) within the context of your organization's overall business risks.", available_places: 20)

User.create!(first_name: "Jacob", last_name: "Scofield", email: "jacob.scofield@hotmail.com", password: "Azerty@123")
User.create!(first_name: "Emma", last_name: "Thompson", email: "emma.thompson@email.com", password: "securePW123")
User.create!(first_name: "John", last_name: "Doe", email: "john.doe@gmail.com", password: "p@ssw0rd!")
User.create!(first_name: "Sarah", last_name: "Johnson", email: "sarah.j@example.com", password: "userPass456")
User.create!(first_name: "Michael", last_name: "Smith", email: "michael.smith@email.net", password: "mikeP@ss789")
User.create!(first_name: "Olivia", last_name: "Davis", email: "olivia.davis@example.org", password: "secureOlivia")
User.create!(first_name: "Younes", last_name: "ST", email: "younes@lewagon.com", password: "rails123")
