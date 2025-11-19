//
//  OneToN.swift
//  LearnSwiftData
//
//  Created by Nguyễn Trung Kiên on 17/11/25.
//

import Foundation
import SwiftUI
import SwiftData
//Bài 1 — Quan hệ 1-n: Project → Tasks
//
//Yêu cầu:
//
//Tạo app quản lý Projects, mỗi Project có nhiều Task.
//
//Model:
//

//
//
//Mục tiêu:
//
//Load danh sách Project với @Query
//
//Bấm vào 1 Project → hiện danh sách Task
//
//Thêm Task mới vào đúng Project
//
//Xoá Project thì xoá luôn tất cả Task (cascade)
//
//Đếm số Task hoàn thành và chưa hoàn thành


struct ProjectListView: View {
    @Environment(\.modelContext) var context
    @Query var projects: [Project]

    @State private var showAdd = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(projects) { project in
                    NavigationLink {
                        ProjectDetailView(project: project)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(project.name)
                                .font(.headline)

                            Text("\(project.tasks.count) tasks")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(projects[index])
                    }
                }
            }
            .navigationTitle("Projects")
            .toolbar {
                Button {
                    showAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAdd) {
                AddProjectView()
            }
        }
    }
}
