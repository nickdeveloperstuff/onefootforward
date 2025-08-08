defmodule SuperdupernovaWeb.RatingTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets
  
  import SuperdupernovaWeb.Widgets.Display

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-8 bg-base-100 min-h-screen">
      <h1 class="text-3xl font-bold mb-8">Rating Widget Test - Phase 3</h1>
      
      <!-- Basic Rating -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Basic Rating</h2>
        <div class="space-y-4">
          <div>
            <p class="mb-2">Default (3/5 stars)</p>
            <.rating value={3} max={5} on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Empty Rating</p>
            <.rating value={0} max={5} on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Full Rating</p>
            <.rating value={5} max={5} on_change="update_rating" />
          </div>
        </div>
      </div>

      <!-- Different Sizes -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Different Sizes</h2>
        <div class="space-y-4">
          <div>
            <p class="mb-2">Extra Small</p>
            <.rating value={4} max={5} size="xs" on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Small</p>
            <.rating value={4} max={5} size="sm" on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Medium (default)</p>
            <.rating value={4} max={5} size="md" on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Large</p>
            <.rating value={4} max={5} size="lg" on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Extra Large</p>
            <.rating value={4} max={5} size="xl" on_change="update_rating" />
          </div>
        </div>
      </div>

      <!-- Different Colors -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Different Colors</h2>
        <div class="space-y-4">
          <div>
            <p class="mb-2">Primary</p>
            <.rating value={4} max={5} color="primary" on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Secondary</p>
            <.rating value={4} max={5} color="secondary" on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Accent</p>
            <.rating value={4} max={5} color="accent" on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Info</p>
            <.rating value={4} max={5} color="info" on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Success</p>
            <.rating value={4} max={5} color="success" on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Warning (default)</p>
            <.rating value={4} max={5} color="warning" on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">Error</p>
            <.rating value={4} max={5} color="error" on_change="update_rating" />
          </div>
        </div>
      </div>

      <!-- Different Max Values -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Different Max Values</h2>
        <div class="space-y-4">
          <div>
            <p class="mb-2">3 Stars Max</p>
            <.rating value={2} max={3} on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">5 Stars Max (default)</p>
            <.rating value={3} max={5} on_change="update_rating" />
          </div>
          <div>
            <p class="mb-2">10 Stars Max</p>
            <.rating value={7} max={10} on_change="update_rating" />
          </div>
        </div>
      </div>

      <!-- Read-only Ratings -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Read-only Ratings</h2>
        <div class="space-y-4">
          <div>
            <p class="mb-2">Product Rating (4.5/5) - Read Only</p>
            <.rating value={4} max={5} readonly={true} />
          </div>
          <div>
            <p class="mb-2">User Review (3/5) - Read Only</p>
            <.rating value={3} max={5} readonly={true} color="info" />
          </div>
        </div>
      </div>

      <!-- Interactive Rating -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Interactive Rating</h2>
        <div class="bg-base-200 p-6 rounded-lg">
          <p class="mb-4">Rate your experience:</p>
          <.rating value={@current_rating} max={5} on_change="update_rating" size="lg" />
          <p class="mt-4 text-lg">Your rating: <%= @current_rating %> / 5</p>
        </div>
      </div>

      <!-- Rating with Labels -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Rating with Labels</h2>
        <div class="space-y-6">
          <div>
            <p class="mb-2">Customer Satisfaction</p>
            <.rating_with_labels 
              value={@satisfaction_rating} 
              max={5}
              labels={["Very Unsatisfied", "Unsatisfied", "Neutral", "Satisfied", "Very Satisfied"]}
              on_change="update_satisfaction"
            />
          </div>
          <div>
            <p class="mb-2">Product Quality</p>
            <.rating_with_labels 
              value={@quality_rating} 
              max={5}
              on_change="update_quality"
            />
          </div>
        </div>
      </div>

      <!-- Heart Rating -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Heart Rating Variant</h2>
        <div class="space-y-4">
          <div>
            <p class="mb-2">Love this feature?</p>
            <.rating_hearts value={@heart_rating} max={5} on_change="update_hearts" />
          </div>
          <div>
            <p class="mb-2">Different sizes</p>
            <div class="space-y-2">
              <.rating_hearts value={3} max={5} size="xs" />
              <.rating_hearts value={3} max={5} size="sm" />
              <.rating_hearts value={3} max={5} size="md" />
              <.rating_hearts value={3} max={5} size="lg" />
            </div>
          </div>
        </div>
      </div>

      <!-- Half Star Rating -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Half Star Rating</h2>
        <div class="space-y-4">
          <div>
            <p class="mb-2">Precise ratings with half stars</p>
            <.rating value={3} max={5} half={true} on_change="update_rating" />
          </div>
        </div>
      </div>

      <!-- Rating in Cards -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Ratings in Product Cards</h2>
        <div class="grid grid-cols-3 gap-4">
          <div class="card bg-base-100 shadow-xl">
            <div class="card-body">
              <h3 class="card-title">Product A</h3>
              <.rating value={5} max={5} readonly={true} size="sm" />
              <p class="text-sm">5.0 (124 reviews)</p>
              <div class="card-actions justify-end">
                <button class="btn btn-primary btn-sm">View</button>
              </div>
            </div>
          </div>
          <div class="card bg-base-100 shadow-xl">
            <div class="card-body">
              <h3 class="card-title">Product B</h3>
              <.rating value={4} max={5} readonly={true} size="sm" />
              <p class="text-sm">4.2 (89 reviews)</p>
              <div class="card-actions justify-end">
                <button class="btn btn-primary btn-sm">View</button>
              </div>
            </div>
          </div>
          <div class="card bg-base-100 shadow-xl">
            <div class="card-body">
              <h3 class="card-title">Product C</h3>
              <.rating value={3} max={5} readonly={true} size="sm" />
              <p class="text-sm">3.5 (42 reviews)</p>
              <div class="card-actions justify-end">
                <button class="btn btn-primary btn-sm">View</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket,
      current_rating: 3,
      satisfaction_rating: 0,
      quality_rating: 0,
      heart_rating: 0
    )}
  end

  @impl true
  def handle_event("update_rating", %{"rating" => rating}, socket) do
    {:noreply, assign(socket, current_rating: String.to_integer(rating))}
  end

  @impl true
  def handle_event("update_satisfaction", %{"rating" => rating}, socket) do
    {:noreply, assign(socket, satisfaction_rating: String.to_integer(rating))}
  end

  @impl true
  def handle_event("update_quality", %{"rating" => rating}, socket) do
    {:noreply, assign(socket, quality_rating: String.to_integer(rating))}
  end

  @impl true
  def handle_event("update_hearts", %{"rating" => rating}, socket) do
    {:noreply, assign(socket, heart_rating: String.to_integer(rating))}
  end
end