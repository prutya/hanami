RSpec.describe 'Routing helpers', type: :integration do
  it "uses routing helpers within action" do
    with_project do
      generate "action web home#index --url=/"
      generate "action web books#index --url=/books"

      # Add `as:` option, so it can be used by the routing helper
      replace "apps/web/config/routes.rb", "/books", "get '/books', to: 'books#index', as: :books"
      rewrite "apps/web/controllers/home/index.rb", <<-EOF
module Web::Controllers::Home
  class Index
    include Web::Action

    def call(params)
      redirect_to routes.books_url
    end
  end
end
EOF

      server do
        visit "/"

        expect(current_path).to eq("/books")
      end
    end
  end

  it "uses routing helpers within view" do
    with_project do
      generate "action web books#index --url=/books"
      generate "action web books#show --url=/books/:id"
      generate "action web books/reviews#new --url=/books/:id/reviews/new"

      # Add `as:` option, so it can be used by the routing helper
      replace "apps/web/config/routes.rb", "/books/:id", "get '/books/:id', to: 'books#show', as: :book"
      replace "apps/web/config/routes.rb", "/books/:id/reviews/new", "get '/books/:id/reviews/new', to: 'books/reviews#new', as: :new_book_review"
      rewrite "apps/web/views/books/index.rb", <<-EOF
module Web::Views::Books
  class Index
    include Web::View

    def featured_book_path
      routes.path(:book, id: 23)
    end
  end
end
EOF
      rewrite "apps/web/templates/books/index.html.erb", <<-EOF
<h1>Books</h1>
<h2><a href="<%= featured_book_path %>">Featured Book</a></h2>
EOF
      rewrite "apps/web/templates/books/show.html.erb", <<-EOF
<h1>Book</h1>
<h2><a href="<%= routes.new_book_review_path(id: params[:id]) %>">New Review</a></h2>
EOF

      server do
        visit "/books"

        expect(page.body).to include(%(<a href="/books/23">Featured Book</a>))

        visit "/books/23"

        expect(page.body).to include(%(<a href="/books/23/reviews/new">New Review</a>))
      end
    end
  end
end
