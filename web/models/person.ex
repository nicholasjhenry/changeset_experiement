defmodule Directory.Person do
  use Directory.Web, :model

  schema "people" do
    field :given_name, :string
    field :family_name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:given_name, :family_name])
    |> validate_required([:given_name, :family_name])
    |> unique_constraint(:family_name)
  end
end
