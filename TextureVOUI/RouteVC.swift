//
//  RouteVC.swift
//  TextureVOUI
//
//  Created by Jefferson Setiawan on 13/09/21.
//

import UIKit

public final class RouteVC: UITableViewController {
    private enum Route: String, CaseIterable {
        case isAccessibilityFalse = "Is Accessibility False"
        case controlNode = "ASControlNode Issue"
        case tooNested = "Too Nested Case"
        case wrappingUsingControlNode = "Using ASControlNode to Wrap Layout"
        case voiceOverActivationPoint = "Voice Over Activation Point"
        case accesibilityOnUIKit = "UIKit Example for Accessibility"
        case exampleForSharingSession = "Example Identifier in Texture"
        case textureIssue = "⚠️ Texture Issue"
    }

    private let routes: [Route] = Route.allCases

    public init() {
        super.init(style: .insetGrouped)

        title = "Texture UITest Issue"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedRoute = routes[indexPath.row]
        switch selectedRoute {
        case .isAccessibilityFalse:
            navigationController?.pushViewController(IsAccessibilityElementVC(), animated: true)
        case .controlNode:
            navigationController?.pushViewController(ControlNodeVC(), animated: true)
        case .tooNested:
            navigationController?.pushViewController(TooNestedVC(), animated: true)
        case .wrappingUsingControlNode:
            navigationController?.pushViewController(FailureIdentifier1VC(), animated: true)
        case .voiceOverActivationPoint:
            navigationController?.pushViewController(ActivationPointVC(), animated: true)
        case .accesibilityOnUIKit:
            navigationController?.pushViewController(AccessibilityUIKitViewController(), animated: true)
        case .exampleForSharingSession:
            navigationController?.pushViewController(TextureAccessibilityIdentifier(), animated: true)
        case .textureIssue:
            navigationController?.pushViewController(TextureIssueRouteVC(), animated: true)
        }
    }

    override public func tableView(_: UITableView, numberOfRowsInSection: Int) -> Int {
        return routes.count
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = routes[indexPath.row].rawValue
        return cell
    }

    internal required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
