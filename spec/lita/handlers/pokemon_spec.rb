require "spec_helper"

describe Lita::Handlers::Pokemon, lita_handler: true do

  it { is_expected.to route("throw a pokeball!") }
  it { is_expected.to route("pokemon 25") }
  it { is_expected.to route("pokemon 44") }
  it { is_expected.not_to route("throw a pokeball") }

  # it "should respond with a random pokemon name" do
  #   send_message("throw a pokeball!")
  #   name = get_random_pokemon(25)
  #   expect(replies.last).to eq("I choose you Pikachu!")
  # end

  it "should respond with a Pikachu" do
    send_message("pokemon 25")
    expect(replies.last).to eq("I choose you Pikachu!")
  end

  it "should respond with a Gloom" do
    send_message("pokemon 044")
    expect(replies.last).to eq("I choose you Gloom!")
  end

  it "should respond with an semi-too large error" do
    send_message("pokemon 779")
    expect(replies.last).to eq("You've picked a too high of a pokedex number!")
  end

  it "should respond with an too large error" do
    send_message("pokemon 800")
    expect(replies.last).to eq("You've picked a too high of a pokedex number!")
  end

  it "should respond with an non number error" do
    send_message("pokemon pokemon")
    expect(replies.last).to eq("You've picked a non-number for the pokedex!")
  end
end
