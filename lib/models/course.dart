import 'package:flutter/material.dart';

class Course {
  // khởi tạo biến
  final String? id;
  final String title;
  final String description;
  final String imageUrl;
  final String author;
  final bool isBookMarked;
  final int duration;
  final List<int> daysOfWeek;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  // tạo tham số
  Course({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.author,
    this.isBookMarked = false,
    required this.duration,
    required this.daysOfWeek,
    required this.startTime,
    required this.endTime,
  });

  Course copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? author,
    bool? isBookMarked,
    int? duration,
    List<int>? daysOfWeek,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      author: author ?? this.author,
      isBookMarked: isBookMarked ?? this.isBookMarked,
      duration: duration ?? this.duration,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  //   // Hàm geneticAlgorithm để sắp xếp lịch trình tránh đụng độ
  // List<Course> geneticAlgorithm(List<Course> courses) {
  //   // Số lượng thế hệ
  //   final int generations = 100;

  //   // Kích thước quần thể (population)
  //   final int populationSize = 50;

  //   // Độ đa dạng của quần thể
  //   final double diversity = 0.1;

  //   // Hệ số đánh giá (evaluation coefficient)
  //   final double evaluationCoefficient = 0.8;

  //   // Tạo quần thể ban đầu ngẫu nhiên
  //   List<List<Course>> population = [];
  //   for (int i = 0; i < populationSize; i++) {
  //     List<Course> chromosome = _randomChromosome(courses);
  //     population.add(chromosome);
  //   }

  //   // Tiến hành đánh giá và lựa chọn
  //   for (int generation = 0; generation < generations; generation++) {
  //     // Đánh giá các cá thể trong quần thể
  //     List<double> fitness = [];
  //     for (int i = 0; i < populationSize; i++) {
  //       double score = _evaluateFitness(population[i]);
  //       fitness.add(score);
  //     }

  //     // Lựa chọn cá thể tốt nhất để tiếp tục
  //     double maxFitness = fitness.reduce(max);
  //     int maxIndex = fitness.indexOf(maxFitness);
  //     List<Course> bestChromosome = population[maxIndex];

  //     // Tạo một quần thể mới từ các cá thể tốt nhất
  //     List<List<Course>> newPopulation = [bestChromosome];
  //     for (int i = 1; i < populationSize; i++) {
  //       List<Course> selectedChromosome = _tournamentSelection(population, fitness);
  //       List<Course> mutatedChromosome = _mutate(selectedChromosome, diversity);
  //       newPopulation.add(mutatedChromosome);
  //     }

  //     population = newPopulation;
  //   }

  //   // Trả về lịch trình tốt nhất sau khi tìm kiếm
  //   double bestFitness = double.negativeInfinity;
  //   List<Course> bestSchedule = [];
  //   for (int i = 0; i < populationSize; i++) {
  //     double fitness = _evaluateFitness(population[i]);
  //     if (fitness > bestFitness) {
  //       bestFitness = fitness;
  //       bestSchedule = population[i];
  //     }
  //   }

  //   return bestSchedule;
  // }

  // // Hàm tạo một chromosome ngẫu nhiên
  // List<Course> _randomChromosome(List<Course> courses) {
  //   List<Course> chromosome = [];
  //   List<Course> shuffledCourses = [...courses]..shuffle();
  //   for (var course in shuffledCourses) {
  //     chromosome.add(course);
  //   }
  //   return chromosome;
  // }

  // // Hàm đánh giá độ tốt của một chromosome (lịch trình)
  // double _evaluateFitness(List<Course> schedule) {
  //   // Thực hiện các đánh giá để tính toán độ tốt của lịch trình
  //   // Ví dụ: đếm số lượng xung đột giữa các khóa học, ưu tiên thời gian bắt đầu sớm, ...
  //   // Trong ví dụ này, ta có thể tính tổng thời gian trống giữa các khóa học
  //   double fitness = 0;
  //   for (int i = 0; i < schedule.length - 1; i++) {
  //     DateTime endTime = schedule[i].endTime;
  //     DateTime nextStartTime = schedule[i + 1].startTime;
  //     if (nextStartTime.isAfter(endTime)) {
  //       fitness += nextStartTime.difference(endTime).inMinutes.toDouble();
  //     }
  //   }
  //   return fitness;
  // }

  // // Hàm chọn lọc theo phương pháp giải đấu (tournament selection)
  // List<Course> _tournamentSelection(List<List<Course>> population, List<double> fitness) {
  //   // Chọn ngẫu nhiên một số lượng cá thể để so sánh
  //   final int tournamentSize = 5;
  //   List<int> tournamentIndices = List.generate(population.length, (index) => index)
  //       ..shuffle()
  //       ..take(tournamentSize);

  //   // Chọn cá thể tốt nhất trong giải đấu
  //   double bestFitness = double.negativeInfinity;
  //   int bestIndex = 0;
  //   for (int index in tournamentIndices) {
  //     if (fitness[index] > bestFitness) {
  //       bestFitness = fitness[index];
  //       bestIndex = index;
  //     }
  //   }

  //   return population[bestIndex];
  // }

  // // Hàm đột biến (mutation) để tạo độ đa dạng trong quần thể
  // List<Course> _mutate(List<Course> chromosome, double diversity) {
  //   // Tính toán số lượng gene cần đột biến
  //   final int mutationCount = (chromosome.length * diversity).round();

  //   // Đột biến ngẫu nhiên một số lượng gene
  //   List<Course> mutatedChromosome = [...chromosome];
  //   for (int i = 0; i < mutationCount; i++) {
  //     int index = Random().nextInt(chromosome.length);
  //     mutatedChromosome[index] = chromosome[(index + 1) % chromosome.length];
  //   }

  //   return mutatedChromosome;
  // }
}
