defmodule SuperdupernovaWeb.AshFormSimpleTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets
  alias Superdupernova.Accounts.TestUser

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-unit-4">Ash Form Integration Test (Simplified)</h1>
        
        <.form for={@form} phx-change="validate" phx-submit="save">
          <.form_section title="Basic Information">
            <.text_input field={@form[:name]} label="Full Name" size="6x1" />
            <.email_input field={@form[:email]} label="Email Address" size="6x1" />
            <.number_input field={@form[:age]} label="Age" size="2x1" min={1} max={150} />
            <.select_input 
              field={@form[:country]} 
              label="Country" 
              size="4x1"
              options={[
                {"United States", "us"},
                {"Canada", "ca"},
                {"United Kingdom", "uk"},
                {"Australia", "au"}
              ]} 
            />
          </.form_section>
          
          <.form_section title="Additional Information">
            <.textarea field={@form[:bio]} label="Bio" size="12x2" 
              placeholder="Tell us about yourself..." />
            <.toggle field={@form[:notifications]} 
              label="Receive email notifications" size="6x1" />
          </.form_section>
          
          <.divider />
          
          <.lego_grid>
            <button type="submit" class="btn btn-primary w-full">
              <%= if @saving do %>
                Saving...
              <% else %>
                Register User
              <% end %>
            </button>
            <button type="button" class="btn btn-ghost w-full" phx-click="reset">
              Reset Form
            </button>
          </.lego_grid>
        </.form>
        
        <%= if @success do %>
          <.alert type="success" title="Success!" dismissible={true}>
            User registered successfully with email: <%= @success %>
          </.alert>
        <% end %>
        
        <%= if @errors != [] do %>
          <.alert type="error" title="Validation Errors">
            <ul>
              <%= for error <- @errors do %>
                <li><%= error %></li>
              <% end %>
            </ul>
          </.alert>
        <% end %>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    form = 
      %TestUser{}
      |> Ash.Changeset.for_create(:register)
      |> to_form()
    
    {:ok, 
     socket
     |> assign(form: form, saving: false, success: nil, errors: [])}
  end

  @impl true
  def handle_event("validate", %{"test_user" => params}, socket) do
    changeset = 
      %TestUser{}
      |> Ash.Changeset.for_create(:register, params, domain: Superdupernova.TestAccounts)
    
    form = to_form(changeset)
    {:noreply, assign(socket, form: form)}
  end

  @impl true
  def handle_event("save", %{"test_user" => params}, socket) do
    socket = assign(socket, saving: true)
    
    changeset = 
      %TestUser{}
      |> Ash.Changeset.for_create(:register, params, domain: Superdupernova.TestAccounts)
    
    case Ash.create(changeset) do
      {:ok, user} ->
        new_form = 
          %TestUser{}
          |> Ash.Changeset.for_create(:register)
          |> to_form()
        
        {:noreply,
         socket
         |> assign(saving: false, success: user.email, errors: [])
         |> assign(form: new_form)}

      {:error, changeset} ->
        errors = 
          changeset.errors
          |> Enum.map(fn error -> 
            "#{error.field || "General"}: #{inspect(error)}"
          end)
        
        {:noreply, assign(socket, form: to_form(changeset), saving: false, errors: errors)}
    end
  end

  @impl true
  def handle_event("reset", _, socket) do
    form = 
      %TestUser{}
      |> Ash.Changeset.for_create(:register)
      |> to_form()
    
    {:noreply, assign(socket, form: form, success: nil, errors: [])}
  end
end