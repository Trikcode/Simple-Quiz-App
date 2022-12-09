
class Retake {
		final String question;
		final String correctAnswer;
		final List<String> incorrectAnswers;

		Retake({this.question, this.correctAnswer, this.incorrectAnswers});

		factory Retake.fromJson(Map<String, dynamic> json) {
				return Retake(
						question: json['question'],
						correctAnswer: json['correct_answer'],
						incorrectAnswers: json['incorrect_answers'].cast<String>(),
				);
		}

		Map<String, dynamic> toJson() {
				return {
						'question': question,
						'correct_answer': correctAnswer,
						'incorrect_answers': incorrectAnswers,
				};
		}

		@override
		String toString() {
				return 'Retake{question: $question, correctAnswer: $correctAnswer, incorrectAnswers: $incorrectAnswers}';
		}
		
}