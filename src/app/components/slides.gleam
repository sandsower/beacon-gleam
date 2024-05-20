import gleam/list
import nakai/attr
import nakai/html

fn slide(title: String, content: List(html.Node)) -> html.Node {
  html.section([], [html.h1([], [html.Text(title)])] |> list.append(content))
}

pub fn what_is_gleam() -> html.Node {
  slide("Gleam?", [
    html.p([], [
      html.div([attr.class("flex-auto flex-col align-start")], [
        html.div([], [html.Text("Statically-typed")]),
        html.div([], [html.Text("Functional")]),
        html.div([], [html.Text("Scalable")]),
        html.div([], [html.Text("Simple")]),
      ]),
    ]),
  ])
}

pub fn why_use_gleam() -> html.Node {
  slide("", [
    slide("Why Gleam?", [
      html.div([], [
        html.div([], [html.Text("Safety")]),
        html.div([], [html.Text("Simplicity")]),
        html.div([], [html.Text("Scalability")]),
        html.div([], [html.Text("Maintainability")]),
      ]),
    ]),
    slide("Safety", [
      html.p([], [
        html.Text(
          "Gleam's type system catches many common bugs at compile time, reducing the number of runtime errors.",
        ),
      ]),
    ]),
    slide("Simplicity", [
      html.p([], [
        html.div([], [html.Text("Small footprint")]),
        html.div([], [html.Text("C-like syntax, familiar")]),
      ]),
    ]),
    slide("Single codebase, run everywhere", [
      html.div([], [
        html.div([], [html.Text("From db to frontend")]),
        html.div([], [html.Text("No more context switching")]),
        html.div([], [html.Text("Compiles to JS and Erlang")]),
      ]),
    ]),
    slide("Maintainability", [
      html.p([], [
        html.Text(
          "Gleam's expressive syntax and powerful type system make it easy to understand and refactor code.",
        ),
      ]),
    ]),
  ])
}

pub fn the_power_of_the_beam() -> html.Node {
  slide("", [
    slide("Gleam BEAM lean machine", [
      html.div([], [
        html.div([], [html.Text("Concurrency")]),
        html.div([], [html.Text("Fault tolerance")]),
        html.div([], [html.Text("Scalability")]),
      ]),
    ]),
    slide("Concurrency", [
      html.div([], [
        html.div([], [html.Text("Run millions of processes concurrently")]),
        html.div([], [html.Text("Harnesses the power of multi-core CPUs")]),
        // TODO add image of big companies using BEAM
      ]),
    ]),
    slide("Fault tolerance", [
      html.div([], [
        html.Text(
          "Recovers from errors and crashes without losing data or stopping the system.",
        ),
      ]),
      html.div([], [
        html.Text(
          "Supervision trees make it easy to build self-healing systems.",
        ),
      ]),
    ]),
    slide("Scalability", [
      html.div([], [
        html.Text(
          "Recovers from errors and crashes without losing data or stopping the system.",
        ),
        html.br([]),
        html.br([]),
        html.Text(
          "Supervision trees make it easy to build self-healing systems.",
        ),
      ]),
    ]),
  ])
}

pub fn healthy_ecosystem() -> html.Node {
  slide("", [
    slide("Ship it!", [
      html.div([], [
        html.div([], [html.Text("Very healthy ecosystem")]),
        html.div([], [html.Text("Nice community")]),
        html.div([], [html.Text("Already a lot of useful libraries")]),
      ]),
    ]),
    slide("Lustre", [
      html.div([], [
        html.div([], [html.Text("Frontend framework")]),
        html.div([], [html.Text("Inspired by Elm")]),
        html.div([], [html.Text("Batteries included")]),
      ]),
    ]),
    slide("Wisp", [
      html.div([], [
        html.div([], [html.Text("Backend HTTP server")]),
        html.div([], [html.Text("Simple and fast")]),
        html.div([], [html.Text("Powerful")]),
      ]),
    ]),
    slide("Fly.io support", [
      html.div([], [
        html.div([], [html.Text("Easy deployment")]),
        html.div([], [html.Text("Good support")]),
      ]),
    ]),
  ])
}

pub fn thank_you() -> html.Node {
  slide("Thank you!", [])
}
