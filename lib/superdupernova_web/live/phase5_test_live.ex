defmodule SuperdupernovaWeb.Phase5TestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets
  
  # Avoid import conflict by aliasing
  import SuperdupernovaWeb.CoreComponents, except: [list: 1]

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-3xl font-bold mb-6">Phase 5: Form Enhancement Components</h1>
        
        <.lego_grid>
          <!-- Section 5.1.1: Fieldset Widget -->
          <div class="widget-12x4">
            <h2 class="text-2xl font-semibold mb-4">5.1.1 Fieldset Widget</h2>
            
            <div class="space-y-4">
              <!-- Bordered Fieldset -->
              <.fieldset legend="User Information" variant="bordered" size="12x2">
                <input type="text" placeholder="First Name" class="input input-bordered w-full mb-2" />
                <input type="text" placeholder="Last Name" class="input input-bordered w-full mb-2" />
                <input type="email" placeholder="Email Address" class="input input-bordered w-full" />
              </.fieldset>
              
              <!-- Ghost Fieldset -->
              <.fieldset legend="Address Details" variant="ghost" size="12x2">
                <input type="text" placeholder="Street Address" class="input input-bordered w-full mb-2" />
                <input type="text" placeholder="City" class="input input-bordered w-full mb-2" />
                <input type="text" placeholder="ZIP Code" class="input input-bordered w-full" />
              </.fieldset>
              
              <!-- Plain Fieldset -->
              <.fieldset legend="Preferences" variant="plain" size="12x1">
                <label class="label cursor-pointer">
                  <input type="checkbox" class="checkbox" />
                  <span class="label-text ml-2">Subscribe to newsletter</span>
                </label>
                <label class="label cursor-pointer">
                  <input type="checkbox" class="checkbox" />
                  <span class="label-text ml-2">Receive notifications</span>
                </label>
              </.fieldset>
              
              <!-- Disabled Fieldset -->
              <.fieldset legend="Disabled Section" variant="bordered" disabled={true} size="12x1">
                <input type="text" placeholder="This is disabled" class="input input-bordered w-full" disabled />
              </.fieldset>
            </div>
          </div>
          
          <!-- Section 5.1.2: Label Widget -->
          <div class="widget-12x2">
            <h2 class="text-2xl font-semibold mb-4">5.1.2 Label Widget</h2>
            
            <div class="space-y-2">
              <!-- Basic Label -->
              <.label for="basic_input" text="Basic Label" />
              <input id="basic_input" type="text" class="input input-bordered w-full" />
              
              <!-- Required Label -->
              <.label for="required_input" text="Required Field" required={true} />
              <input id="required_input" type="text" class="input input-bordered w-full" />
              
              <!-- Label with Hint -->
              <.label for="hint_input" text="Email" hint="We'll never share your email" />
              <input id="hint_input" type="email" class="input input-bordered w-full" />
              
              <!-- Label with Error -->
              <.label for="error_input" text="Password" error="Password must be at least 8 characters" />
              <input id="error_input" type="password" class="input input-bordered input-error w-full" />
            </div>
          </div>
          
          <!-- Section 5.1.3: Filter Widget -->
          <div class="widget-12x2">
            <h2 class="text-2xl font-semibold mb-4">5.1.3 Filter Widget</h2>
            
            <.filter 
              filters={@filters}
              on_filter="apply_filters"
              show_clear={true}
              size="12x2"
            />
          </div>
          
          <!-- Section 5.1.4: Validator Widget -->
          <div class="widget-12x3">
            <h2 class="text-2xl font-semibold mb-4">5.1.4 Validator Widget</h2>
            
            <div class="space-y-4">
              <!-- Password Validator -->
              <div>
                <label class="label">
                  <span class="label-text">Password Strength Validator</span>
                </label>
                <input 
                  type="password" 
                  value={@password}
                  phx-keyup="validate_password"
                  class="input input-bordered w-full mb-2" 
                  placeholder="Enter password"
                />
                <.validator 
                  field="password"
                  value={@password}
                  rules={@password_rules}
                  show_success={true}
                />
              </div>
              
              <!-- Email Validator (Inline) -->
              <div>
                <label class="label">
                  <span class="label-text">Email Validator (Inline)</span>
                </label>
                <input 
                  type="email" 
                  value={@email}
                  phx-keyup="validate_email"
                  class="input input-bordered w-full mb-2" 
                  placeholder="Enter email"
                />
                <.validator 
                  field="email"
                  value={@email}
                  rules={@email_rules}
                  inline={true}
                />
              </div>
              
              <!-- Username Validator -->
              <div>
                <label class="label">
                  <span class="label-text">Username Validator</span>
                </label>
                <input 
                  type="text" 
                  value={@username}
                  phx-keyup="validate_username"
                  class="input input-bordered w-full mb-2" 
                  placeholder="Enter username"
                />
                <.validator 
                  field="username"
                  value={@username}
                  rules={@username_rules}
                  show_success={false}
                />
              </div>
            </div>
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    filters = [
      %{
        name: "status",
        label: "Status",
        type: :select,
        selected: nil,
        options: [
          %{value: "active", label: "Active"},
          %{value: "inactive", label: "Inactive"},
          %{value: "pending", label: "Pending"}
        ]
      },
      %{
        name: "search",
        label: "Search",
        type: :text,
        value: "",
        placeholder: "Search..."
      },
      %{
        name: "date",
        label: "Date Range",
        type: :date_range,
        from: nil,
        to: nil
      }
    ]
    
    password_rules = [
      %{type: :required, message: "Password is required"},
      %{type: :min_length, min: 8, message: "At least 8 characters"},
      %{type: :pattern, pattern: "[A-Z]", message: "At least one uppercase letter"},
      %{type: :pattern, pattern: "[0-9]", message: "At least one number"},
      %{type: :pattern, pattern: "[!@#$%^&*]", message: "At least one special character"}
    ]
    
    email_rules = [
      %{type: :required, message: "Required"},
      %{type: :email, message: "Valid email"}
    ]
    
    username_rules = [
      %{type: :required, message: "Username is required"},
      %{type: :min_length, min: 3, message: "At least 3 characters"},
      %{type: :max_length, max: 20, message: "Maximum 20 characters"},
      %{type: :pattern, pattern: "^[a-zA-Z0-9_]+$", message: "Only letters, numbers, and underscores"}
    ]
    
    {:ok, assign(socket,
      filters: filters,
      password: "",
      password_rules: password_rules,
      email: "",
      email_rules: email_rules,
      username: "",
      username_rules: username_rules
    )}
  end

  @impl true
  def handle_event("validate_password", %{"value" => value}, socket) do
    {:noreply, assign(socket, password: value)}
  end

  @impl true
  def handle_event("validate_email", %{"value" => value}, socket) do
    {:noreply, assign(socket, email: value)}
  end

  @impl true
  def handle_event("validate_username", %{"value" => value}, socket) do
    {:noreply, assign(socket, username: value)}
  end

  @impl true
  def handle_event("apply_filters", _params, socket) do
    # Handle filter application
    {:noreply, socket}
  end

  @impl true
  def handle_event("clear_filters", _params, socket) do
    # Reset filters
    {:noreply, socket}
  end
end