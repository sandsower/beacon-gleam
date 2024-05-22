import gleam/list
import nakai/attr
import nakai/html

fn text(content: String) -> html.Node {
  html.div([attr.class("text-base text-fuchsia-100")], [html.Text(content)])
}

fn code(content: String) -> html.Node {
  html.section([attr.class("code")], [
    html.pre([attr.class("h-full")], [
      html.code_text([attr.class("language-gleam")], content),
    ]),
  ])
}

fn slide(title: String, content: List(html.Node)) -> html.Node {
  html.section(
    [],
    [html.div([attr.class("header")], [html.Text(title)])]
      |> list.append(content),
  )
}

pub fn talking_gleam() -> html.Node {
  slide("Gleam", [
    html.div([attr.class("flex-auto flex-col align-start")], [
      html.img([
        attr.src("https://gleam.run/images/lucy/lucy.svg"),
        attr.style("all: initial; height: 18rem; width: 18rem; padding: 1rem;"),
      ]),
    ]),
  ])
}

pub fn what_is_gleam() -> html.Node {
  slide("", [
    slide("Gleam is...", [
      html.div([attr.class("flex-auto flex-col align-start")], [
        text("Statically-typed"),
        text("Functional"),
        text("Scalable"),
        text("Simple"),
      ]),
    ]),
    code(
      "
  import gleam/json
  import gleam/result.{try}
  import my_app/person
  import wisp.{type Request, type Response}

  pub fn handle(req: Request, ctx: Context) -> Response {
    use json <- wisp.require_json(req)

    let result = {
      use data <- try(person.decode(json))
      use row <- try(person.insert(ctx.db, data))
      Ok(person.to_json(row))
    }

    case result {
      Ok(json) -> wisp.json_response(json, 201)
      Error(_) -> wisp.unprocessable_entity()
    }
  }
    ",
    ),
  ])
}

pub fn why_use_gleam() -> html.Node {
  slide("", [
    slide("Benefits", [html.div([], [])]),
    slide("Safety", [text("Strict types"), text("No runtime errors")]),
    slide("Simplicity", [
      text("Small footprint"),
      text("C-like syntax, familiar"),
    ]),
    slide("Single codebase", [
      html.div([], [
        text("From db to frontend"),
        text("Compiles to JS and Erlang"),
      ]),
    ]),
    code(
      "
import gleam/io

pub type DateTime

// Depending on the target 
// the implementation will be different

@external(erlang, \"calendar\", \"local_time\")
@external(javascript, \"./my_package_ffi.mjs\", \"now\")
pub fn now() -> DateTime

pub fn main() {
  io.debug(now())
}
    ",
    ),
    slide("Maintainability", [
      text("Optimized for readability"),
      text("Easy to refactor"),
    ]),
    slide("Fun", [
      text("Fast feedback loop"),
      text("Robust pattern matching"),
      text("Great tooling"),
    ]),
    code(
      "
pub type ErrorMsg {
  RetriesFailed(Int)
  Generic(String)
  UnexpectedExit()
}

pub fn process_msg(input: ErrorMsg) {
  case input {
    Generic(\"Error: \" <> msg) -> error(msg)
    RetriesFailed(num) -> 
         error(\"Retries failed: \" <> num |> int.to_string)
    _ -> error(\"Unexpected exit\")
  }
}
    ",
    ),
  ])
}

pub fn the_power_of_the_beam() -> html.Node {
  slide("", [
    slide("Gleam BEAM lean machine", [html.div([], [])]),
    slide("Concurrency", [
      html.div([], [
        text("Millions of processes concurrently"),
        text("Harnesses the power of multi-core CPUs"),
      ]),
    ]),
    slide("Fault tolerance", [
      text("Battle tested for over 30 years"),
      text("Self-healing"),
    ]),
    slide("Scalability", [
      html.div([], [text("Distributed"), text("Hot code swapping")]),
    ]),
  ])
}

pub fn healthy_ecosystem() -> html.Node {
  slide("", [
    slide("Ship it!", [
      html.div([], [
        text("Very healthy ecosystem"),
        text("Nice community"),
        text("Lots of useful libraries"),
      ]),
    ]),
    slide("Lustre", [
      html.div([], [
        text("Frontend framework"),
        text("Inspired by Elm"),
        text("Batteries included"),
      ]),
    ]),
    slide("Wisp", [
      html.div([], [
        text("Backend HTTP server"),
        text("Simple and fast"),
        text("Powerful"),
      ]),
    ]),
    slide("Fly.io", [
      html.div([], [
        text("Easy deployment"),
        text("Good support"),
        text("Painless"),
      ]),
    ]),
  ])
}

pub fn resources() {
  slide("Resources", [
    html.div([], [
      text("Gleam website:"),
      text("https://gleam.run"),
      html.br([]),
      text("Exercism Gleam track:"), 
      text("https://exercism.io/tracks/gleam"),
      html.br([]),
      text("CodeCrafters: "),
      text("https://codecrafters.io"),
    ]),
  ])
}

pub fn thank_you() -> html.Node {
  slide("Thank you!", [])
}
