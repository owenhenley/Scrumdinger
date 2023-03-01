//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Owen Henley on 01/03/2023.
//

import SwiftUI

struct DetailEditView: View {
    
    @State private var data = DailyScrum.Data()
    @State private var newAttendeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 1...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityLabel("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $data.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { row in
                    data.attendees.remove(atOffsets: row)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeName)
                            data.attendees.append(attendee)
                            
                            newAttendeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Attendee")
                    }
                    .disabled(newAttendeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
