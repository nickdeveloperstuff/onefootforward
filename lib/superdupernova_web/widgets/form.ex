defmodule SuperdupernovaWeb.Widgets.Form do
  use Phoenix.Component
  import SuperdupernovaWeb.CoreComponents

  @doc """
  Text input widget with grid sizing
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :placeholder, :string, default: ""
  attr :size, :string, default: "4x1", values: ["2x1", "4x1", "6x1", "12x1"]
  attr :rest, :global, include: ~w(type required pattern title autocomplete)

  def text_input(assigns) do
    ~H"""
    <div class={size_class(@size)}>
      <fieldset class="fieldset">
        <%= if @label do %>
          <label class="label" for={@field.id}><%= @label %></label>
        <% end %>
        <input
          id={@field.id}
          name={@field.name}
          value={@field.value}
          class="input input-bordered w-full"
          placeholder={@placeholder}
          phx-feedback-for={@field.name}
          {@rest}
        />
        <%= for msg <- Enum.map(@field.errors, &translate_error(&1)) do %>
          <p class="mt-2 text-sm text-error"><%= msg %></p>
        <% end %>
      </fieldset>
    </div>
    """
  end

  @doc """
  Email input widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :placeholder, :string, default: "email@example.com"
  attr :size, :string, default: "4x1"

  def email_input(assigns) do
    assigns = assign(assigns, :type, "email")
    ~H"""
    <.text_input field={@field} label={@label} placeholder={@placeholder} 
      size={@size} type={@type} autocomplete="email" />
    """
  end

  @doc """
  Password input widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :placeholder, :string, default: ""
  attr :size, :string, default: "4x1"

  def password_input(assigns) do
    assigns = assign(assigns, :type, "password")
    ~H"""
    <.text_input field={@field} label={@label} placeholder={@placeholder} 
      size={@size} type={@type} autocomplete="current-password" />
    """
  end

  @doc """
  Number input widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :placeholder, :string, default: ""
  attr :size, :string, default: "2x1"
  attr :min, :integer, default: nil
  attr :max, :integer, default: nil
  attr :step, :any, default: nil

  def number_input(assigns) do
    extra_attrs = 
      []
      |> then(fn attrs -> if assigns.min, do: [{:min, assigns.min} | attrs], else: attrs end)
      |> then(fn attrs -> if assigns.max, do: [{:max, assigns.max} | attrs], else: attrs end)
      |> then(fn attrs -> if assigns.step, do: [{:step, assigns.step} | attrs], else: attrs end)
    
    assigns = assign(assigns, :extra_attrs, extra_attrs)
    
    ~H"""
    <div class={size_class(@size)}>
      <fieldset class="fieldset">
        <%= if @label do %>
          <label class="label" for={@field.id}><%= @label %></label>
        <% end %>
        <input
          id={@field.id}
          name={@field.name}
          value={@field.value}
          type="number"
          class="input input-bordered w-full"
          placeholder={@placeholder}
          phx-feedback-for={@field.name}
          {@extra_attrs}
        />
        <%= for msg <- Enum.map(@field.errors, &translate_error(&1)) do %>
          <p class="mt-2 text-sm text-error"><%= msg %></p>
        <% end %>
      </fieldset>
    </div>
    """
  end

  @doc """
  Textarea widget for multi-line text
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :placeholder, :string, default: ""
  attr :size, :string, default: "12x2", values: ["6x2", "12x2", "12x4"]
  attr :rows, :integer, default: nil

  def textarea(assigns) do
    rows = case assigns.size do
      "6x2" -> 3
      "12x2" -> 3
      "12x4" -> 6
      _ -> assigns.rows || 3
    end
    
    assigns = assign(assigns, :rows, rows)
    
    ~H"""
    <div class={size_class(@size)}>
      <fieldset class="fieldset">
        <%= if @label do %>
          <label class="label" for={@field.id}><%= @label %></label>
        <% end %>
        <textarea
          id={@field.id}
          name={@field.name}
          class="textarea textarea-bordered w-full"
          placeholder={@placeholder}
          rows={@rows}
          phx-feedback-for={@field.name}
        ><%= @field.value %></textarea>
        <%= for msg <- Enum.map(@field.errors, &translate_error(&1)) do %>
          <p class="mt-2 text-sm text-error"><%= msg %></p>
        <% end %>
      </fieldset>
    </div>
    """
  end

  @doc """
  Select dropdown widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :options, :list, required: true
  attr :prompt, :string, default: "Choose an option"
  attr :size, :string, default: "4x1"

  def select_input(assigns) do
    ~H"""
    <div class={size_class(@size)}>
      <fieldset class="fieldset">
        <%= if @label do %>
          <label class="label" for={@field.id}><%= @label %></label>
        <% end %>
        <select
          id={@field.id}
          name={@field.name}
          class="select select-bordered w-full"
          phx-feedback-for={@field.name}
        >
          <option value=""><%= @prompt %></option>
          <%= for {label, value} <- @options do %>
            <option value={value} selected={to_string(value) == to_string(@field.value)}>
              <%= label %>
            </option>
          <% end %>
        </select>
        <%= for msg <- Enum.map(@field.errors, &translate_error(&1)) do %>
          <p class="mt-2 text-sm text-error"><%= msg %></p>
        <% end %>
      </fieldset>
    </div>
    """
  end

  @doc """
  Checkbox widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, required: true
  attr :size, :string, default: "4x1"

  def checkbox(assigns) do
    ~H"""
    <div class={size_class(@size)}>
      <label class="label cursor-pointer">
        <span class="label-text"><%= @label %></span>
        <input
          type="checkbox"
          id={@field.id}
          name={@field.name}
          value="true"
          checked={@field.value == true || @field.value == "true"}
          class="checkbox"
          phx-feedback-for={@field.name}
        />
      </label>
      <%= for msg <- Enum.map(@field.errors, &translate_error(&1)) do %>
        <p class="mt-2 text-sm text-error"><%= msg %></p>
      <% end %>
    </div>
    """
  end

  @doc """
  Toggle switch widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, required: true
  attr :size, :string, default: "4x1"

  def toggle(assigns) do
    ~H"""
    <div class={size_class(@size)}>
      <label class="label cursor-pointer">
        <span class="label-text"><%= @label %></span>
        <input
          type="checkbox"
          id={@field.id}
          name={@field.name}
          value="true"
          checked={@field.value == true || @field.value == "true"}
          class="toggle"
          phx-feedback-for={@field.name}
        />
      </label>
      <%= for msg <- Enum.map(@field.errors, &translate_error(&1)) do %>
        <p class="mt-2 text-sm text-error"><%= msg %></p>
      <% end %>
    </div>
    """
  end

  @doc """
  Radio group widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :options, :list, required: true
  attr :size, :string, default: "4x2"

  def radio_group(assigns) do
    ~H"""
    <div class={size_class(@size)}>
      <fieldset class="fieldset">
        <%= if @label do %>
          <legend class="label"><%= @label %></legend>
        <% end %>
        <div class="space-y-2">
          <%= for {label, value} <- @options do %>
            <label class="label cursor-pointer justify-start gap-2">
              <input
                type="radio"
                name={@field.name}
                value={value}
                checked={to_string(value) == to_string(@field.value)}
                class="radio"
                phx-feedback-for={@field.name}
              />
              <span class="label-text"><%= label %></span>
            </label>
          <% end %>
        </div>
        <%= for msg <- Enum.map(@field.errors, &translate_error(&1)) do %>
          <p class="mt-2 text-sm text-error"><%= msg %></p>
        <% end %>
      </fieldset>
    </div>
    """
  end

  @doc """
  File input widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :accept, :string, default: nil
  attr :size, :string, default: "6x1"

  def file_input(assigns) do
    ~H"""
    <div class={size_class(@size)}>
      <fieldset class="fieldset">
        <%= if @label do %>
          <label class="label"><%= @label %></label>
        <% end %>
        <input
          type="file"
          id={@field.id}
          name={@field.name}
          class="file-input file-input-bordered w-full"
          accept={@accept}
          phx-feedback-for={@field.name}
        />
        <%= for msg <- Enum.map(@field.errors, &translate_error(&1)) do %>
          <p class="mt-2 text-sm text-error"><%= msg %></p>
        <% end %>
      </fieldset>
    </div>
    """
  end

  @doc """
  Date input widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :size, :string, default: "4x1"

  def date_input(assigns) do
    ~H"""
    <.text_input field={@field} label={@label} size={@size} type="date" />
    """
  end

  @doc """
  Time input widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :size, :string, default: "4x1"

  def time_input(assigns) do
    ~H"""
    <.text_input field={@field} label={@label} size={@size} type="time" />
    """
  end

  @doc """
  DateTime input widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :size, :string, default: "6x1"

  def datetime_input(assigns) do
    ~H"""
    <.text_input field={@field} label={@label} size={@size} type="datetime-local" />
    """
  end

  @doc """
  Range slider widget
  """
  attr :field, Phoenix.HTML.FormField, required: true
  attr :label, :string, default: nil
  attr :size, :string, default: "4x1"
  attr :min, :integer, default: 0
  attr :max, :integer, default: 100
  attr :step, :integer, default: 1

  def range_slider(assigns) do
    ~H"""
    <div class={size_class(@size)}>
      <fieldset class="fieldset">
        <%= if @label do %>
          <label class="label" for={@field.id}>
            <%= @label %>
            <span class="text-sm opacity-70">(<%= @field.value || @min %>)</span>
          </label>
        <% end %>
        <input
          type="range"
          id={@field.id}
          name={@field.name}
          value={@field.value || @min}
          min={@min}
          max={@max}
          step={@step}
          class="range"
          phx-feedback-for={@field.name}
        />
        <div class="w-full flex justify-between text-xs px-2">
          <span><%= @min %></span>
          <span><%= @max %></span>
        </div>
        <%= for msg <- Enum.map(@field.errors, &translate_error(&1)) do %>
          <p class="mt-2 text-sm text-error"><%= msg %></p>
        <% end %>
      </fieldset>
    </div>
    """
  end

  @doc """
  Fieldset widget for grouping related form fields
  """
  attr :legend, :string, default: nil
  attr :size, :string, default: "12x2", values: ["4x1", "6x1", "8x1", "12x1", "6x2", "12x2", "12x4"]
  attr :variant, :string, default: "bordered", values: ["bordered", "ghost", "plain"]
  attr :disabled, :boolean, default: false
  attr :class, :string, default: ""
  slot :inner_block, required: true

  def fieldset(assigns) do
    ~H"""
    <fieldset 
      class={["form-control", size_class(@size), fieldset_variant_class(@variant), @class]}
      disabled={@disabled}
    >
      <%= if @legend do %>
        <legend class="label">
          <span class="label-text text-base font-semibold"><%= @legend %></span>
        </legend>
      <% end %>
      <div class="space-y-2">
        <%= render_slot(@inner_block) %>
      </div>
    </fieldset>
    """
  end

  @doc """
  Label widget for form fields
  """
  attr :for, :string, required: true
  attr :text, :string, required: true
  attr :required, :boolean, default: false
  attr :hint, :string, default: nil
  attr :error, :string, default: nil
  attr :class, :string, default: ""

  def label(assigns) do
    ~H"""
    <label for={@for} class={["label", @class]}>
      <span class="label-text">
        <%= @text %>
        <%= if @required do %>
          <span class="text-error">*</span>
        <% end %>
      </span>
      <%= if @hint do %>
        <span class="label-text-alt"><%= @hint %></span>
      <% end %>
    </label>
    <%= if @error do %>
      <label class="label">
        <span class="label-text-alt text-error"><%= @error %></span>
      </label>
    <% end %>
    """
  end

  @doc """
  Filter widget for data filtering interface
  """
  attr :filters, :list, default: []
  attr :on_filter, :any, default: nil
  attr :size, :string, default: "12x1", values: ["6x1", "8x1", "12x1", "12x2"]
  attr :show_clear, :boolean, default: true
  attr :class, :string, default: ""
  slot :inner_block

  def filter(assigns) do
    ~H"""
    <div class={["card bg-base-200", size_class(@size), @class]}>
      <div class="card-body p-4">
        <div class="flex flex-wrap gap-2">
          <%= for filter <- @filters do %>
            <div class="form-control">
              <label class="label">
                <span class="label-text text-xs"><%= filter.label %></span>
              </label>
              <%= case filter.type do %>
                <% :select -> %>
                  <select 
                    name={filter.name} 
                    class="select select-bordered select-sm"
                    phx-change={@on_filter}
                  >
                    <option value="">All</option>
                    <%= for option <- filter.options do %>
                      <option value={option.value} selected={option.value == filter.selected}>
                        <%= option.label %>
                      </option>
                    <% end %>
                  </select>
                <% :text -> %>
                  <input 
                    type="text" 
                    name={filter.name}
                    value={filter.value}
                    placeholder={filter.placeholder}
                    class="input input-bordered input-sm"
                    phx-change={@on_filter}
                    phx-debounce="300"
                  />
                <% :date_range -> %>
                  <div class="flex gap-2">
                    <input 
                      type="date" 
                      name={"#{filter.name}_from"}
                      value={filter.from}
                      class="input input-bordered input-sm"
                      phx-change={@on_filter}
                    />
                    <span class="text-xs self-center">to</span>
                    <input 
                      type="date" 
                      name={"#{filter.name}_to"}
                      value={filter.to}
                      class="input input-bordered input-sm"
                      phx-change={@on_filter}
                    />
                  </div>
                <% _ -> %>
                  <%= render_slot(@inner_block, filter) %>
              <% end %>
            </div>
          <% end %>
          <%= if @show_clear do %>
            <div class="form-control justify-end">
              <button 
                type="button" 
                class="btn btn-ghost btn-sm"
                phx-click="clear_filters"
              >
                Clear All
              </button>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  @doc """
  Validator widget for form field validation display
  """
  attr :field, :string, required: true
  attr :rules, :list, default: []
  attr :value, :string, default: ""
  attr :show_success, :boolean, default: true
  attr :inline, :boolean, default: false
  attr :class, :string, default: ""

  def validator(assigns) do
    ~H"""
    <div class={["validator", @class, if(@inline, do: "inline-flex gap-2", else: "space-y-1")]}>
      <%= for rule <- @rules do %>
        <% is_valid = validate_rule(rule, @value) %>
        <div class={[
          "flex items-center gap-1 text-sm",
          if(is_valid && @show_success, do: "text-success", else: ""),
          if(!is_valid && @value != "", do: "text-error", else: ""),
          if(@value == "", do: "text-base-content/50", else: "")
        ]}>
          <%= if is_valid && @value != "" do %>
            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/>
            </svg>
          <% else %>
            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
            </svg>
          <% end %>
          <span><%= rule.message %></span>
        </div>
      <% end %>
    </div>
    """
  end

  defp validate_rule(%{type: :required}, value), do: value != "" && value != nil
  defp validate_rule(%{type: :min_length, min: min}, value), do: String.length(value || "") >= min
  defp validate_rule(%{type: :max_length, max: max}, value), do: String.length(value || "") <= max
  defp validate_rule(%{type: :pattern, pattern: pattern}, value) do
    case Regex.compile(pattern) do
      {:ok, regex} -> Regex.match?(regex, value || "")
      _ -> false
    end
  end
  defp validate_rule(%{type: :email}, value) do
    regex = ~r/^[^\s@]+@[^\s@]+\.[^\s@]+$/
    Regex.match?(regex, value || "")
  end
  defp validate_rule(%{type: :numeric}, value) do
    case Float.parse(value || "") do
      {_, ""} -> true
      _ -> false
    end
  end
  defp validate_rule(_, _), do: true

  defp fieldset_variant_class("bordered"), do: "border border-base-300 rounded-lg p-4"
  defp fieldset_variant_class("ghost"), do: "bg-base-200/50 rounded-lg p-4"
  defp fieldset_variant_class("plain"), do: "p-2"
  defp fieldset_variant_class(_), do: "border border-base-300 rounded-lg p-4"

  defp size_class("2x1"), do: "widget-2x1"
  defp size_class("4x1"), do: "widget-4x1"
  defp size_class("4x2"), do: "widget-4x1"
  defp size_class("6x1"), do: "widget-6x1"
  defp size_class("6x2"), do: "widget-6x1"
  defp size_class("12x1"), do: "widget-12x1"
  defp size_class("12x2"), do: "widget-12x1"
  defp size_class("12x4"), do: "widget-12x1"
  defp size_class(_), do: "widget-4x1"
end