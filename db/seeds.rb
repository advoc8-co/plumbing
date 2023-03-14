# Resets

# NOTE: resetting data is more complicated than it might seem. Drop and recreate db for now.

# Creates

multi = User.create! name: Faker::Name.first_name

abc = Company.create! name: "ABC Co"
abc.users << multi
xyz = Company.create! name: "XYZ Co"
xyz.users << multi

4.times { Stakeholder.create! name: Faker::Name.first_name }

Tenant.switch!(abc, multi)

2.times { abc.users.create! name: Faker::Name.first_name }

3.times do
  Project.create!({name: Faker::Company.bs, stakeholders: Stakeholder.all.sample(2)})
end

4.times do
  Post.create({
    company_user: CompanyUser.all.sample,
    project: Project.all.sample,
    title: Faker::Lorem.words(number: 2).join(" "),
    body: Faker::Lorem.paragraphs(number: 3)
  })
end

Tenant.switch!(xyz, multi)

2.times { abc.users.create! name: Faker::Name.first_name }
xyz.users << multi

xyz.projects.create!({
  name: Faker::Company.bs,
  stakeholders: Stakeholder.all.sample(3)
})
