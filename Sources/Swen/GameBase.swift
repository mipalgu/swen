import Glibc

public protocol GameBaseDelegate : GameLoop {
  init(withWindow: Window, andPipeline: ContentPipeline)
}

public class GameBase<Game: GameBaseDelegate> {
  public let pipeline: ContentPipeline
  public let window: Window
  public let delegate: Game

  public init(withTitle title: String, size: Size<Int32>, andDelegate delegate: Game.Type) throws {
    try SDL.initSDL()

    self.window = try Window(withTitle: title, andSize: size)
    self.pipeline = ContentPipeline(withRenderer: self.window.renderer)
    self.delegate = delegate.init(withWindow: window, andPipeline: pipeline)
  }

  public func start() {
    while true {
      Event.poll {
        event in
        switch event {
        case is QuitEvent: self.close()
        default: Void()
        }
      }

      window.renderer.clear()
      delegate.draw()
      delegate.loop()
      window.renderer.present()

      SDL.delay(ms: 100)
    }
  }

  public func close() -> Void {
    SDL.quitSDL()
    exit(-1)
  }
}