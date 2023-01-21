//
//  MailView.swift
//  LifeLoop
//
//  Created by 赵翔宇 on 2023/1/11.
//

import MessageUI

struct SendMailView: UIViewControllerRepresentable {
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
            switch result {
            case .cancelled:
                break
            case .saved:
                break
            case .sent:
                mada(.success)
                AppHelper().popTosta(type: .ok(p: .init(title: "已发送", subline: "邮件已发送，我会及时处理。")))
            case .failed:
                break
            @unknown default:
                break
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        // Configure the email content here
        vc.setSubject("⛰️⛰️⛰️你好赵纯想")
        vc.setMessageBody("", isHTML: false)
        // Set the recipient.
        vc.setToRecipients(["liseami@qq.com", "zhaoxiangyuliseami@gmail.com", "504083897@qq.com"])
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
}
