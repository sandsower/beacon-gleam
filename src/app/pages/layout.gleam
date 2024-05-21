import app/models
import app/web.{type Context}
import nakai/attr
import nakai/html
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
    html.Element(
      "script",
      [
        attr.src(
          "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js",
        ),
      ],
      [],
    ),
    html.Element(
      "script",
      [attr.src("https://gleam.run/javascript/highlightjs-gleam.js")],
      [],
    ),
    html.Element(
      "link",
      [
        attr.rel("stylesheet"),
        attr.href(
          "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/felipec.min.css",
        ),
      ],
      [],
    ),
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
        attr.Attr("data-theme", "light"),
      ],
      [
        child,
        html.Element(
          "script",
          [
            attr.src(
              "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/4.1.2/reveal.js",
            ),
          ],
          [],
        ),
        html.Element(
          "script",
          [
            attr.src(
              "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/4.1.2/plugin/highlight/highlight.min.js",
            ),
          ],
          [],
        ),
        html.Element("script", [], [
          html.Text(
            "Reveal.initialize({
                        plugins: [ RevealHighlight ]
            });
hljs.highlightAll();
        ",
          ),
        ]),
      ],
    ),
  ])
}
