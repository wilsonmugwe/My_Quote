# This file should contain all the record creation needed to seed the database with its default values.

# Clear existing records and reset primary key sequences
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='categories';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='philosophers';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='quotes';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users';")

# Create Categories
categories = Category.create!([
  { category_name: "Political Philosophy" },
  { category_name: "Aesthetics" },
  { category_name: "Ethics" },
  { category_name: "Epistemology" },
  { category_name: "Metaphysics" },
  { category_name: "Axiology" },
  { category_name: "Logic" },
  { category_name: "Existentialism" },
  { category_name: "Philosophy of Mind" },
  { category_name: "Philosophy of Science" }
])

# Create Philosophers
philosophers = Philosopher.create!([
  { fname: "Socrates", lname: nil, birth_year: -470, death_year: -399, biography: "Classical Greek philosopher credited as one of the founders of Western philosophy." },
  { fname: "Aristotle", lname: nil, birth_year: -384, death_year: -322, biography: "Greek philosopher and polymath, student of Plato and teacher of Alexander the Great." },
  { fname: "Plato", lname: nil, birth_year: -427, death_year: -347, biography: "Greek philosopher who founded the Academy in Athens and wrote philosophical dialogues." },
  { fname: "Simone", lname: "de Beauvoir", birth_year: 1908, death_year: 1986, biography: "French existentialist philosopher known for her work on feminism and ethics." },
  { fname: "René", lname: "Descartes", birth_year: 1596, death_year: 1650, biography: "French philosopher and mathematician, often regarded as the father of modern philosophy." },
  { fname: "Laozi", lname: nil, birth_year: -601, death_year: nil, biography: "Ancient Chinese philosopher and writer, traditionally considered the founder of Taoism." },
  { fname: "Friedrich", lname: "Nietzsche", birth_year: 1844, death_year: 1900, biography: "German philosopher known for his critique of traditional morality and religion." },
  { fname: "John", lname: "Locke", birth_year: 1632, death_year: 1704, biography: "English philosopher regarded as one of the most influential Enlightenment thinkers." },
  { fname: "Hannah", lname: "Arendt", birth_year: 1906, death_year: 1975, biography: "German-American philosopher and political theorist known for her works on totalitarianism." },
  { fname: "Karl", lname: "Marx", birth_year: 1818, death_year: 1883, biography: "German philosopher, economist, and revolutionary socialist known for his critique of capitalism." },
  { fname: "Bertrand", lname: "Russell", birth_year: 1872, death_year: 1970, biography: "British philosopher, logician, and social critic known for his work in analytical philosophy." },
  { fname: "Immanuel", lname: "Kant", birth_year: 1724, death_year: 1804, biography: "German philosopher known for his work in epistemology and ethics, particularly the concept of categorical imperative." },
  { fname: "David", lname: "Hume", birth_year: 1711, death_year: 1776, biography: "Scottish philosopher known for his empiricism and skepticism." },
  { fname: "Arthur", lname: "Schopenhauer", birth_year: 1788, death_year: 1860, biography: "German philosopher known for his work on pessimism." },
  { fname: "John", lname: "Stuart Mill", birth_year: 1806, death_year: 1873, biography: "English philosopher known for his contributions to utilitarianism." },
  { fname: "Albert", lname: "Camus", birth_year: 1913, death_year: 1960, biography: "French philosopher known for his work on absurdism." },
  { fname: "Martin", lname: "Heidegger", birth_year: 1889, death_year: 1976, biography: "German philosopher known for his existential and phenomenological approaches." },
  { fname: "Jean-Paul", lname: "Sartre", birth_year: 1905, death_year: 1980, biography: "French existentialist philosopher and playwright." },
  { fname: "Simone", lname: "Weil", birth_year: 1909, death_year: 1943, biography: "French philosopher known for her thoughts on ethics and political philosophy." },
  { fname: "Richard", lname: "Rorty", birth_year: 1931, death_year: 2007, biography: "American philosopher known for his work in pragmatism and anti-essentialism." },
  { fname: "Martha", lname: "Nussbaum", birth_year: 1947, death_year: nil, biography: "American philosopher known for her work in ethics and political philosophy." },
  { fname: "Slavoj", lname: "Žižek", birth_year: 1949, death_year: nil, biography: "Slovenian philosopher known for his work in psychoanalysis and cultural criticism." },
  { fname: "Albert", lname: "Einstein", birth_year: 1929, death_year: nil, biography: "American philosopher known for his work in physics." },
  { fname: "Michel", lname: "Foucault", birth_year: 1926, death_year: 1984, biography: "French philosopher known for his work on power, knowledge, and social institutions." },
  { fname: "Ludwig", lname: "Wittgenstein", birth_year: 1889, death_year: 1951, biography: "Austrian-British philosopher known for his work on language and the philosophy of mind." },
  { fname: "Judith", lname: "Butler", birth_year: 1956, death_year: nil, biography: "American philosopher known for her work in feminist theory and gender studies." },
  { fname: "Gilles", lname: "Deleuze", birth_year: 1925, death_year: 1995, biography: "French philosopher known for his work on difference and repetition." },
  { fname: "Heraclitus", lname: nil, birth_year: -535, death_year: -475, biography: "Pre-Socratic Greek philosopher known for his doctrine of change." },
  { fname: "Søren", lname: "Kierkegaard", birth_year: 1813, death_year: 1855, biography: "Danish philosopher regarded as the father of existentialism." },
  { fname: "Berkeley", lname: "Bishop", birth_year: 1685, death_year: 1753, biography: "Irish philosopher known for his theory of immaterialism." }
])

# Create Users
users = User.create!([
  { fname: "John", lname: "Jones", email: "admin@myquotes.com", password: "admin123", password_confirmation: "admin123", is_admin: true, status: "Active" },
  { fname: "Vincent", lname: "Brown", email: "vinceb@myemail.com", password: "vince123", password_confirmation: "vince123", is_admin: false, status: "Active" },
  { fname: "Michael", lname: "Jackson", email: "michaeljackson@myquotes.com", password: "michael123", password_confirmation: "michael123", is_admin: false, status: "Suspended" },
  { fname: "Conor", lname: "McGregor", email: "conormc@myquotes.com", password: "conor123", password_confirmation: "conor123", is_admin: true, status: "Active" },
  { fname: "Peter", lname: "Pan", email: "peterpan@myquotes.com", password: "peter123", password_confirmation: "peter123", is_admin: false, status: "Banned" },
  { fname: "Serena", lname: "Williams", email: "serena@myemail.com", password: "serena123", password_confirmation: "serena123", is_admin: false, status: "Active" },
  { fname: "Tom", lname: "Brady", email: "brady@myemail.com", password: "brady123", password_confirmation: "brady123", is_admin: false, status: "Active" },
  { fname: "Tiger", lname: "Woods", email: "wooods@myemail.com", password: "woods123", password_confirmation: "woods123", is_admin: false, status: "Active" },
  { fname: "Shohei", lname: "Ohtani", email: "ohtani@myemail.com", password: "ohtani123", password_confirmation: "ohtani123", is_admin: false, status: "Active" },
  { fname: "King", lname: "Kong", email: "kingkong@myquotes.com", password: "king123", password_confirmation: "king123", is_admin: false, status: "Active" }
])



# Create Quotes with Specific User Association
quotes = Quote.create!([
  { quote: "The only true wisdom is in knowing you know nothing.", publication: -399, is_public: true, comments: "Socrates' perspective on wisdom.", philosopher_id: philosophers.find { |p| p.fname == "Socrates" }.id, category_id: categories.find { |c| c.category_name == "Aesthetics" }.id, user_id: users[7].id },
  { quote: "Knowing yourself is the beginning of all wisdom.", publication: -350, is_public: true, comments: "Aristotle on self-knowledge.", philosopher_id: philosophers.find { |p| p.fname == "Aristotle" }.id, category_id: categories.find { |c| c.category_name == "Ethics" }.id, user_id: users[1].id },
  { quote: "The greatest wealth is to live content with little.", publication: -360, is_public: false, comments: "Plato on wealth.", philosopher_id: philosophers.find { |p| p.fname == "Plato" }.id, category_id: categories.find { |c| c.category_name == "Ethics" }.id, user_id: users[2].id },
  { quote: "Compassion is the basis of morality.", publication: 1840, is_public: true, comments: "Arthur Schopenhauer on compassion.", philosopher_id: philosophers.find { |p| p.fname == "Arthur" }.id, category_id: categories.find { |c| c.category_name == "Ethics" }.id, user_id: users[3].id },
  { quote: "Over himself, over his own body and mind, the individual is sovereign.", publication: 1859, is_public: false, comments: "John Stuart Mill on individual sovereignty.", philosopher_id: philosophers.find { |p| p.fname == "John" && p.lname == "Stuart Mill" }.id, category_id: categories.find { |c| c.category_name == "Political Philosophy" }.id, user_id: users[4].id },
  { quote: "The struggle itself towards the heights is enough to fill a man's heart.", publication: 1951, is_public: true, comments: "Albert Camus on struggle.", philosopher_id: philosophers.find { |p| p.fname == "Albert" }.id, category_id: categories.find { |c| c.category_name == "Existentialism" }.id, user_id: users[5].id },
  { quote: "Existence precedes essence.", publication: 1946, is_public: true, comments: "Jean-Paul Sartre on existence.", philosopher_id: philosophers.find { |p| p.fname == "Jean-Paul" }.id, category_id: categories.find { |c| c.category_name == "Existentialism" }.id, user_id: users[6].id },
  { quote: "Attention is the rarest and purest form of generosity.", publication: 1942, is_public: true, comments: "Simone Weil on attention.", philosopher_id: philosophers.find { |p| p.fname == "Simone" && p.lname == "Weil" }.id, category_id: categories.find { |c| c.category_name == "Ethics" }.id, user_id: users[9].id },
  { quote: "Philosophy is not a theory but an activity.", publication: 1979, is_public: true, comments: "Richard Rorty on philosophy.", philosopher_id: philosophers.find { |p| p.fname == "Richard" }.id, category_id: categories.find { |c| c.category_name == "Logic" }.id, user_id: users[8].id },
  { quote: "Justice is not only about the distribution of goods but about the distribution of capabilities.", publication: 2000, is_public: true, comments: "Martha Nussbaum on justice.", philosopher_id: philosophers.find { |p| p.fname == "Martha" }.id, category_id: categories.find { |c| c.category_name == "Ethics" }.id, user_id: users[3].id },
  { quote: "The only thing I can offer is my own experience.", publication: 2012, is_public: false, comments: "Slavoj Žižek on experience.", philosopher_id: philosophers.find { |p| p.fname == "Slavoj" }.id, category_id: categories.find { |c| c.category_name == "Philosophy of Mind" }.id, user_id: users[4].id },
  { quote: "A wise man proportions his belief to the evidence.", publication: 1748, is_public: true, comments: "David Hume on belief.", philosopher_id: philosophers.find { |p| p.fname == "David" }.id, category_id: categories.find { |c| c.category_name == "Epistemology" }.id, user_id: users[5].id },
  { quote: "He who has a why to live can bear almost any how.", publication: 1889, is_public: true, comments: "Friedrich Nietzsche on purpose.", philosopher_id: philosophers.find { |p| p.fname == "Friedrich" }.id, category_id: categories.find { |c| c.category_name == "Existentialism" }.id, user_id: users[8].id },
  { quote: "What worries you, masters you.", publication: 1690, is_public: true, comments: "John Locke on worry.", philosopher_id: philosophers.find { |p| p.fname == "John" && p.lname == "Locke" }.id, category_id: categories.find { |c| c.category_name == "Ethics" }.id, user_id: users[6].id },
  { quote: "To be rooted is perhaps the most important and least recognized need of the human soul.", publication: 1949, is_public: true, comments: "Simone Weil on rootedness.", philosopher_id: philosophers.find { |p| p.fname == "Simone" && p.lname == "Weil" }.id, category_id: categories.find { |c| c.category_name == "Philosophy of Mind" }.id, user_id: users[7].id },
  { quote: "The aim of totalitarian education has never been to instill convictions but to destroy the capacity to form any.", publication: 1954, is_public: true, comments: "Hannah Arendt on education.", philosopher_id: philosophers.find { |p| p.fname == "Hannah" }.id, category_id: categories.find { |c| c.category_name == "Political Philosophy" }.id, user_id: users[8].id },
  { quote: "Science without religion is lame, religion without science is blind.", publication: 1941, is_public: true, comments: "Albert Einstein on science and religion.", philosopher_id: philosophers.find { |p| p.fname == "Albert" && p.lname == "Einstein" }.id, category_id: categories.find { |c| c.category_name == "Philosophy of Science" }.id, user_id: users[4].id },
  { quote: "The good life is one inspired by love and guided by knowledge.", publication: 1930, is_public: false, comments: "Bertrand Russell on the good life.", philosopher_id: philosophers.find { |p| p.fname == "Bertrand" }.id, category_id: categories.find { |c| c.category_name == "Ethics" }.id, user_id: users[7].id }
])



# After creating categories, philosophers, users, and quotes, add the following:

puts "#{categories.size} categories created."
puts "#{philosophers.size} philosophers created."
puts "#{users.size} users created."
puts "#{quotes.size} quotes created."
