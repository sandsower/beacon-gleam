import nakai/html.{div, section}
import nakai/attr
import app/components/slides

const target = "header"

pub fn page() -> html.Node {
  div([attr.id(target), attr.class("reveal")], [
    div([attr.class("slides")], [
      slides.what_is_gleam(),
      slides.why_use_gleam(),
      slides.the_power_of_the_beam(),
      slides.healthy_ecosystem(),
      slides.thank_you(),
    ]),
  ])
}
