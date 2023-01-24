open Ink

module Chance = {
  type t = {
    name: (. unit) => string,
    email: (. unit) => string,
  }

  @module @new
  external make: unit => t = "chance"
}

let chance = Chance.make()

let users = Belt.Array.makeBy(10, i =>
  {
    "id": i->Belt.Int.toString,
    "name": chance.name(.),
    "email": chance.email(.),
  }
)

module Table = {
  @react.component
  let make = () => {
    <Box flexDirection=#column width={#length(80)}>
      <Box>
        <Box width={#percent(10.0)}>
          <Text> {React.string("ID")} </Text>
        </Box>
        <Box width={#percent(50.0)}>
          <Text> {React.string("Name")} </Text>
        </Box>
        <Box width={#percent(40.0)}>
          <Text> {React.string("Email")} </Text>
        </Box>
      </Box>
      {React.array(
        users->Belt.Array.map(user =>
          <Box key={user["id"]}>
            <Box width={#percent(10.0)}>
              <Text> {React.string(user["id"])} </Text>
            </Box>
            <Box width={#percent(50.0)}>
              <Text> {React.string(user["name"])} </Text>
            </Box>
            <Box width={#percent(40.0)}>
              <Text> {React.string(user["email"])} </Text>
            </Box>
          </Box>
        ),
      )}
    </Box>
  }
}

let _ = render(<Table />, ())
