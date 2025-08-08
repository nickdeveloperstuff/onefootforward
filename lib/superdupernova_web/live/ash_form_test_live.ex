defmodule SuperdupernovaWeb.AshFormTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets
  alias Superdupernova.TestAccounts
  alias Superdupernova.Accounts.TestUser

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-unit-4">Ash Form Integration Test</h1>
        
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
            <.button type="submit" variant="primary" grid_size="4x1">
              <%= if @saving do %>
                <.loading size="sm" /> Saving...
              <% else %>
                Register User
              <% end %>
            </.button>
            <.button type="button" variant="secondary" grid_size="4x1"
              phx-click="reset">
              Reset Form
            </.button>
          </.lego_grid>
        </.form>
        
        <%= if @success do %>
          <.alert type="success" title="Success!" dismissible={true}>
            User registered successfully with email: <%= @success %>
          </.alert>
        <% end %>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    form = AshPhoenix.Form.for_create(TestUser, :register, domain: Superdupernova.TestAccounts)
    
    {:ok, 
     socket
     |> assign(form: to_form(form), saving: false, success: nil)}
  end

  @impl true
  def handle_event("validate", %{"form" => params}, socket) do
    form = 
      TestUser
      |> AshPhoenix.Form.for_create(:register, domain: Superdupernova.TestAccounts)
      |> AshPhoenix.Form.validate(params)
      |> to_form()
    
    {:noreply, assign(socket, form: form)}
  end

  @impl true
  def handle_event("save", %{"form" => params}, socket) do
    socket = assign(socket, saving: true)
    
    form = 
      TestUser
      |> AshPhoenix.Form.for_create(:register, domain: Superdupernova.TestAccounts)
      |> AshPhoenix.Form.validate(params)
    
    case AshPhoenix.Form.submit(form) do
      {:ok, user} ->
        new_form = 
          TestUser
          |> AshPhoenix.Form.for_create(:register, domain: Superdupernova.TestAccounts)
          |> to_form()
        
        {:noreply,
         socket
         |> assign(saving: false, success: user.email)
         |> assign(form: new_form)}

      {:error, form} ->
        {:noreply, assign(socket, form: to_form(form), saving: false)}
    end
  end

  @impl true
  def handle_event("reset", _, socket) do
    form = 
      TestUser
      |> AshPhoenix.Form.for_create(:register, domain: Superdupernova.TestAccounts)
      |> to_form()
    
    {:noreply, assign(socket, form: form, success: nil)}
  end
end