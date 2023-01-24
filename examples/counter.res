open Ink

module Counter = {
  @react.component
  let make = () => {
    let (counter, setCounter) = React.useState(() => 0)

    React.useEffect0(() => {
      open Js
      let timer = Global.setInterval(() => {
        setCounter(prev => prev + 1)
      }, 100)
      Some(
        () => {
          timer->Global.clearInterval
        },
      )
    })

    <Text color=#green>
      {React.int(counter)}
      {React.string(" tests passed")}
    </Text>
  }
}

let _ = render(<Counter />, ())
