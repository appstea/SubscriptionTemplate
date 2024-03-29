//
//  TextCraft.swift
//
//  Created by dDomovoj on 7/23/21.
//

import CoreText
import Foundation
import UIKit

enum TextCraft { }

extension TextCraft {

  struct Framesetter {
    internal let _framesetter: CTFramesetter

    init(attributedString: NSAttributedString) {
      _framesetter = CTFramesetterCreateWithAttributedString(attributedString)
    }

    func frame(at range: NSRange = NSRange(location: 0, length: 0), path: CGPath) -> Frame {
      .init(framesetter: self, range: range, path: path)
    }

  }

  struct Frame {

    internal let _frame: CTFrame

    var linesCount: Int { 0 }

    var rect: CGRect { CTFrameGetPath(_frame).boundingBox }

    // MARK: - Init

    init(framesetter: Framesetter, range: NSRange = NSRange(location: 0, length: 0), path: CGPath) {
      let range = CFRange(location: range.location, length: range.length)
      _frame = CTFramesetterCreateFrame(framesetter._framesetter, range, path, nil)
    }

    // MARK: - Public

    func lines() -> [Line] {
      let internalLines = _lines()
      return zip(internalLines, _linesOrigins(count: internalLines.count))
        .enumerated()
        .map { idx, elt in
          Line(line: elt.0, idx: idx, origin: elt.1, frame: self)
        }
    }

    func draw(in ctx: CGContext) {
      ctx.saveGState()
      ctx.textMatrix = .identity
      ctx.translateBy(x: 0, y: rect.height)
      ctx.scaleBy(x: 1, y: -1)

      CTFrameDraw(_frame, ctx)
      ctx.restoreGState()
    }

    // MARK: - Private

    private func _lines() -> [CTLine] {
      ((CTFrameGetLines(_frame) as NSArray) as? [CTLine]) ?? []
    }

    private func _linesOrigins(count: Int) -> [CGPoint] {
      var lineOrigins = [CGPoint](repeating: .zero, count: count)
      CTFrameGetLineOrigins(_frame, CFRangeMake(0, 0), &lineOrigins)
      return lineOrigins
    }

  }

  struct Line: CustomStringConvertible, CustomDebugStringConvertible {

    typealias BoundsOptions = CTLineBoundsOptions

    internal let _line: CTLine
    internal let _frame: Frame

    public let idx: Int
    internal let _origin: CGPoint

    var description: String {
      let pairs: [(key: String, value: Any)] = [
        ("idx", idx),
        ("opt.frame", frame(.useOpticalBounds)),
        ("runs", runs()),
        //                ("_origin", _origin),
        //                ("_line", _line)
      ]
      return pairs.map { $0.key + ": \($0.value)" }
        .joined(separator: ";\n")
    }
    var debugDescription: String { description }

    // MARK: - Init

    fileprivate init(line: CTLine, idx: Int, origin: CGPoint, frame: Frame) {
      _line = line
      _origin = origin
      self.idx = idx
      _frame = frame
    }

    // MARK: - Public

    func runs() -> [Run] {
      ((CTLineGetGlyphRuns(_line) as NSArray) as? [CTRun] ?? []).map { Run(_run: $0) }
    }

    func origin(_ options: BoundsOptions = []) -> CGPoint {
      let localFrameOrigin = CGPoint(x: _origin.x + bounds(options).origin.x,
                                     y: _origin.y + bounds(options).origin.y)
      return CGPoint(x: localFrameOrigin.x, y: _frame.rect.maxY - localFrameOrigin.y)
    }

    func bounds(_ options: BoundsOptions = []) -> CGRect {
      CTLineGetBoundsWithOptions(_line, options)
    }

    func frame(_ options: BoundsOptions = []) -> CGRect {
      let bounds = self.bounds(options)
      let localFrameOrigin = CGPoint(x: _origin.x + bounds.origin.x,
                                     y: _origin.y + bounds.origin.y)
      let origin = CGPoint(x: localFrameOrigin.x, y: _frame.rect.maxY - localFrameOrigin.y - bounds.height)
      return CGRect(origin: origin, size: bounds.size)
    }

  }

  struct Run {
    internal let _run: CTRun
  }

}

// MARK: - AttributedString

extension NSAttributedString {

  func frame(in rect: CGRect) -> TextCraft.Frame {
    let path = CGPath(rect: rect, transform: nil)
    let framesetter = TextCraft.Framesetter(attributedString: self)
    let frame = framesetter.frame(path: path)
    return frame
  }

  func lines(in rect: CGRect) -> [TextCraft.Line] {
    frame(in: rect).lines()
  }

}
