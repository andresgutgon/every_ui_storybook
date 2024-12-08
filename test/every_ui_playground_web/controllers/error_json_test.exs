defmodule EveryUiPlaygroundWeb.ErrorJSONTest do
  use EveryUiPlaygroundWeb.ConnCase, async: true

  test "renders 404" do
    assert EveryUiPlaygroundWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert EveryUiPlaygroundWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
