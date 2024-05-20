import app/models
import app/web.{type Context}
import nakai/html
import nakai/attr
import wisp

pub type Props {
  Props(title: String, ctx: Context, req: wisp.Request, route: models.Route)
}

pub fn header(title: String) -> html.Node {
  html.Head([
    html.meta([attr.charset("utf-8")]),
    html.link([attr.rel("stylesheet"), attr.href("/assets/css/styles.css")]),
    html.Element("script", [attr.src("/assets/js/htmx.min.js")], []),
    html.Element(
      "link",
      [
        attr.rel("stylesheet"),
        attr.href(
          "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.6.0/css/reveal.min.css",
        ),
      ],
      [],
    ),
    // Using the black theme as default, customize as needed
    html.Element(
      "link",
      [
        attr.rel("stylesheet"),
        attr.href(
          "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.6.0/css/theme/black.min.css",
        ),
      ],
      [],
    ),
    html.title(title),
  ])
}

pub fn render(child: html.Node, props: Props) -> html.Node {
  let title = case props.title {
    "" -> "Template"
    title -> title
  }

  html.Fragment([
    header(title),
    html.Body(
      [
        attr.class("mt-[9vh]"),
        attr.id("main"),
        attr.Attr("hx-ext", "response-targets"),
        attr.Attr("hx-boost", "true"),
      ],
      [
        child,
        html.Element(
          "script",
          [
            attr.src(
              "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.6.0/js/reveal.min.js",
            ),
          ],
          [],
        ),
        html.Element("script", [], [html.Text("Reveal.initialize();")]),
      ],
    ),
  ])
}
