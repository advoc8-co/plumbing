# Resets

# NOTE: this is more complicated than it might seem. To delete untenanted classes with associations
# to tenanted classes you, need to set Current.company.

Stakeholder.destroy_all
Tenant.all { |c| Project.destroy_all }
Tenant.all { |c| CompanyUser.destroy_all }
Tenant.all { |c| User.destroy_all }
Tenant.all { |c| c.destroy! }

# Creates

abc = Company.create! name: "ABC Co"
xyz = Company.create! name: "XYZ Co"

multi = User.create! name: Faker::Name.first_name

4.times { Stakeholder.create! name: Faker::Name.first_name }

Tenant.switch(abc) do
  2.times { abc.users.create! name: Faker::Name.first_name }
  abc.users << multi

  3.times do
    Project.create!({name: Faker::Company.bs, stakeholders: Stakeholder.all.sample(2)})
  end

  4.times do
    Post.create({
      user: User.all.sample,
      project: Project.all.sample,
      title: Faker::Lorem.words(number: 2).join(" "),
      body: Faker::Lorem.paragraphs(number: 3)
    })
  end
end

Tenant.switch(xyz) do
  2.times { abc.users.create! name: Faker::Name.first_name }
  xyz.users << multi

  xyz.projects.create!({
    name: Faker::Company.bs,
    stakeholders: Stakeholder.all.sample(3)
  })
end
