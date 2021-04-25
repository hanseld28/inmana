defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Siri Cascudo", email: "siri@cascudo.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{
                 email: "siri@cascudo.com",
                 name: "Siri Cascudo"
               },
               valid?: true
             } = response
    end

    test "when there are invalid params, retunrs an invalid changeset" do
      params = %{name: "Re", email: ""}

      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 3 character(s)"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
