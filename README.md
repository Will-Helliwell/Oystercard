# Oyster Card

Fully test-driven back-end logic for a non-account-based ticketing system based on London's Oystercard. Project was written 2 weeks into bootcamp, and so about 6 weeks into my 
learning to code journey.

Focus for the project:
  - Introduction to OOP and SOLID coding prnciples in Ruby
  - Introduction to testing and mocking

## Classes

Oystercard:
- New instances are created with an initial balance (can be given on creation, otherwise defauts to zero) and an empty journey history
- Can be topped up to increase the balance
- Can be touched in to start a journey (unless the card's balance is below the minimum fare for a journey)
- Can be touched out to end a journey, subtracting the correct fare from the balance (at this stage of development, all fares cost 1). Completing a journey also adds the journey to the journey history.
- If a customer either touches in or out twice in a row, then they have failed to touch in or out on a previous journey and so are charged the penalty fare (currently 6)

Journey:
- Used to keep track of entry and exit stations and calculate the correct fare for individual journeys.

Station:
- WIP - for the next user stories

## Screenshot of app in use

![screenshot](https://github.com/Will-Helliwell/bank_tech_test/blob/master/bank_tech_test_screenshot.png
)

## User Stories 

### Completed
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from
```

### In Progress
```
In order to know where I have been
As a customer
I want to see to all my previous trips
```

### Possibilities for Extension
```
In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## Setup

`git clone path-to-your-repo`
`command_to_install_dependencies` (e.g. `bundle`)

## Usage

`command_to_start` (e.g. `rackup` or `rails s`)
Navigate to `http://localhost:4567/`

- May need to go into further detail (e.g. 'public methods available')


## Running tests

`test_command` (e.g. `rspec`)
All tests passing
- Coverage:
  - X%
  - X unit tests
  - X feature tests
- Isolation - describe

# Other Contributors

This project was written over a series of 5 days pairing with other students.

